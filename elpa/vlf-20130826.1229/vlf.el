;;; vlf.el --- View Large Files  -*- lexical-binding: t -*-

;; Copyright (C) 2006, 2012, 2013  Free Software Foundation, Inc.

;; Version: 20130826.1229
;; X-Original-Version: 0.9.1
;; Keywords: large files, utilities
;; Maintainer: Andrey Kotlarski <m00naticus@gmail.com>
;; Authors: 2006 Mathias Dahl <mathias.dahl@gmail.com>
;;          2012 Sam Steingold <sds@gnu.org>
;;          2013 Andrey Kotlarski <m00naticus@gmail.com>
;; URL: https://github.com/m00natic/vlfi

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; This package provides the M-x vlf command, which visits part of a
;; large file without loading the entire file.
;; The buffer uses VLF mode, which defines several commands for
;; moving around, searching and editing selected part of file.

;; This package was inspired by a snippet posted by Kevin Rodgers,
;; showing how to use `insert-file-contents' to extract part of a
;; file.

;;; Code:

(defgroup vlf nil
  "View Large Files in Emacs."
  :prefix "vlf-"
  :group 'files)

(defcustom vlf-batch-size 1024
  "Defines how large each batch of file data is (in bytes)."
  :type 'integer
  :group 'vlf)
(put 'vlf-batch-size 'permanent-local t)

;;; Keep track of file position.
(defvar vlf-start-pos 0
  "Absolute position of the visible chunk start.")
(put 'vlf-start-pos 'permanent-local t)

(defvar vlf-end-pos 0 "Absolute position of the visible chunk end.")
(put 'vlf-end-pos 'permanent-local t)

(defvar vlf-file-size 0 "Total size of presented file.")
(put 'vlf-file-size 'permanent-local t)

(defvar vlf-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map [M-next] 'vlf-next-batch)
    (define-key map [M-prior] 'vlf-prev-batch)
    (define-key map "+" 'vlf-change-batch-size)
    (define-key map "-"
      (lambda () "Decrease vlf batch size by factor of 2."
        (interactive)
        (vlf-change-batch-size t)))
    (define-key map "s" 'vlf-re-search-forward)
    (define-key map "r" 'vlf-re-search-backward)
    (define-key map "o" 'vlf-occur)
    (define-key map "[" 'vlf-beginning-of-file)
    (define-key map "]" 'vlf-end-of-file)
    (define-key map "e" 'vlf-edit-mode)
    (define-key map "j" 'vlf-jump-to-chunk)
    (define-key map "l" 'vlf-goto-line)
    map)
  "Keymap for `vlf-mode'.")

(define-derived-mode vlf-mode special-mode "VLF"
  "Mode to browse large files in."
  (setq buffer-read-only t)
  (set-buffer-modified-p nil)
  (buffer-disable-undo)
  (add-hook 'write-file-functions 'vlf-write nil t)
  (make-local-variable 'revert-buffer-function)
  (setq revert-buffer-function 'vlf-revert)
  (make-local-variable 'vlf-batch-size)
  (make-local-variable 'vlf-start-pos)
  (make-local-variable 'vlf-end-pos)
  (make-local-variable 'vlf-file-size))

;;;###autoload
(defun vlf (file)
  "View Large FILE.
Batches of the file data from FILE will be displayed in a read-only
buffer.  You can customize number of bytes displayed by customizing
`vlf-batch-size'."
  (interactive "fFile to open: ")
  (with-current-buffer (generate-new-buffer "*vlf*")
    (set-visited-file-name file)
    (vlf-mode)
    (setq vlf-file-size (vlf-get-file-size buffer-file-name))
    (vlf-insert-file)
    (switch-to-buffer (current-buffer))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; integration with other packages

;;;###autoload
(defun dired-vlf ()
  "In Dired, visit the file on this line in VLF mode."
  (interactive)
  (vlf (dired-get-file-for-visit)))

;;;###autoload
(eval-after-load "dired"
  '(define-key dired-mode-map "V" 'dired-vlf))

;;;###autoload
(defadvice abort-if-file-too-large (around vlf-if-file-too-large
                                           (size op-type
                                                 &optional filename)
                                           compile activate)
  "If file SIZE larger than `large-file-warning-threshold', \
allow user to view file with `vlf', open it normally, or abort.
OP-TYPE specifies the file operation being performed over FILENAME."
  (and large-file-warning-threshold size
       (> size large-file-warning-threshold)
       (let ((char nil))
         (while (not (memq (setq char
                                 (read-event
                                  (propertize
                                   (format
                                    "File %s is large (%s): \
%s normally (o), %s with vlf (v) or abort (a)"
                                    (if filename
                                        (file-name-nondirectory filename)
                                      "")
                                    (file-size-human-readable size)
                                    op-type op-type)
                                   'face 'minibuffer-prompt)))
                           '(?o ?O ?v ?V ?a ?A))))
         (cond ((memq char '(?o ?O)))
               ((memq char '(?v ?V))
                (vlf filename)
                (error ""))
               ((memq char '(?a ?A))
                (error "Aborted"))))))


;; scroll auto batching
(defadvice scroll-up (around vlf-scroll-up
                             activate compile)
  "Slide to next batch if at end of buffer in `vlf-mode'."
  (if (and (derived-mode-p 'vlf-mode)
           (eobp))
      (progn (vlf-next-batch 1)
             (goto-char (point-min)))
    ad-do-it))

(defadvice scroll-down (around vlf-scroll-down
                               activate compile)
  "Slide to previous batch if at beginning of buffer  in `vlf-mode'."
  (if (and (derived-mode-p 'vlf-mode)
           (bobp))
      (progn (vlf-prev-batch 1)
             (goto-char (point-max)))
    ad-do-it))

;; non-recent Emacs
;;;###autoload
(unless (fboundp 'file-size-human-readable)
  (defun file-size-human-readable (file-size)
    "Print FILE-SIZE in MB."
    (format "%.1fMB" (/ file-size 1048576.0))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; utilities

(defun vlf-change-batch-size (decrease)
  "Change the buffer-local value of `vlf-batch-size'.
Normally, the value is doubled;
with the prefix argument DECREASE it is halved."
  (interactive "P")
  (setq vlf-batch-size (if decrease
                            (/ vlf-batch-size 2)
                          (* vlf-batch-size 2)))
  (vlf-move-to-batch vlf-start-pos))

(defun vlf-format-buffer-name ()
  "Return format for vlf buffer name."
  (format "%s(%s)[%d/%d](%d)"
          (file-name-nondirectory buffer-file-name)
          (file-size-human-readable vlf-file-size)
          (/ vlf-end-pos vlf-batch-size)
          (/ vlf-file-size vlf-batch-size)
          vlf-batch-size))

(defun vlf-update-buffer-name ()
  "Update the current buffer name."
  (rename-buffer (vlf-format-buffer-name) t))

(defun vlf-get-file-size (file)
  "Get size in bytes of FILE."
  (nth 7 (file-attributes file)))

(defun vlf-verify-size ()
  "Update file size information if necessary and visited file time."
  (unless (verify-visited-file-modtime (current-buffer))
    (setq vlf-file-size (vlf-get-file-size buffer-file-name))
    (set-visited-file-modtime)))

(defun vlf-insert-file (&optional from-end)
  "Insert first chunk of current file contents in current buffer.
With FROM-END prefix, start from the back."
  (let ((start 0)
        (end vlf-batch-size))
    (if from-end
        (setq start (- vlf-file-size vlf-batch-size)
              end vlf-file-size)
      (setq end (min vlf-batch-size vlf-file-size)))
    (vlf-move-to-chunk start end)))

(defun vlf-beginning-of-file ()
  "Jump to beginning of file content."
  (interactive)
  (vlf-insert-file))

(defun vlf-end-of-file ()
  "Jump to end of file content."
  (interactive)
  (vlf-insert-file t))

(defun vlf-revert (&optional _ignore-auto noconfirm)
  "Revert current chunk.  Ignore _IGNORE-AUTO.
Ask for confirmation if NOCONFIRM is nil."
  (if (or noconfirm
          (yes-or-no-p (format "Revert buffer from file %s? "
                               buffer-file-name)))
      (vlf-move-to-chunk-2 vlf-start-pos vlf-end-pos)))

(defun vlf-jump-to-chunk (n)
  "Go to to chunk N."
  (interactive "nGoto to chunk: ")
  (vlf-move-to-batch (* (1- n) vlf-batch-size)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; batch movement

(defun vlf-next-batch (append)
  "Display the next batch of file data.
When prefix argument is supplied and positive
 jump over APPEND number of batches.
When prefix argument is negative
 append next APPEND number of batches to the existing buffer."
  (interactive "p")
  (vlf-verify-size)
  (let* ((end (min (+ vlf-end-pos (* vlf-batch-size
                                      (abs append)))
                   vlf-file-size))
         (start (if (< append 0)
                    vlf-start-pos
                  (- end vlf-batch-size))))
    (vlf-move-to-chunk start end)))

(defun vlf-prev-batch (prepend)
  "Display the previous batch of file data.
When prefix argument is supplied and positive
 jump over PREPEND number of batches.
When prefix argument is negative
 append previous PREPEND number of batches to the existing buffer."
  (interactive "p")
  (if (zerop vlf-start-pos)
      (error "Already at BOF"))
  (let* ((start (max 0 (- vlf-start-pos (* vlf-batch-size
                                            (abs prepend)))))
         (end (if (< prepend 0)
                  vlf-end-pos
                (+ start vlf-batch-size))))
    (vlf-move-to-chunk start end)))

(defun vlf-move-to-batch (start &optional minimal)
  "Move to batch determined by START.
Adjust according to file start/end and show `vlf-batch-size' bytes.
When given MINIMAL flag, skip non important operations."
  (vlf-verify-size)
  (let* ((start (max 0 start))
         (end (min (+ start vlf-batch-size) vlf-file-size)))
    (if (= vlf-file-size end)          ; re-adjust start
        (setq start (max 0 (- end vlf-batch-size))))
    (vlf-move-to-chunk start end minimal)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; primitive chunk operations

(defun vlf-move-to-chunk (start end &optional minimal)
  "Move to chunk determined by START END.
When given MINIMAL flag, skip non important operations.
If same as current chunk is requested, do nothing."
  (unless (and (= start vlf-start-pos)
               (= end vlf-end-pos))
    (vlf-verify-size)
    (if (buffer-modified-p)
        (if (vlf-move-to-chunk-1 start end)
            (or minimal (vlf-update-buffer-name)))
      (vlf-move-to-chunk-2 start end)
      (or minimal (vlf-update-buffer-name)))))

(defun vlf-move-to-chunk-1 (start end)
  "Move to chunk determined by START END keeping as much edits if any.
Return t if move hasn't been canceled."
  (let ((modified (buffer-modified-p))
        (start (max 0 start))
        (end (min end vlf-file-size))
        (edit-end (+ (position-bytes (point-max)) vlf-start-pos)))
    (cond
     ((and (= start vlf-start-pos) (= end edit-end))
      (unless modified
        (vlf-move-to-chunk-2 start end)
        t))
     ((or (<= edit-end start) (<= end vlf-start-pos))
      (when (or (not modified)
                (y-or-n-p "Buffer modified, are you sure? ")) ; full chunk renewal
        (vlf-move-to-chunk-2 start end)
        t))
     ((or (and (<= start vlf-start-pos) (<= edit-end end))
          (not modified)
          (y-or-n-p "Buffer modified, are you sure? "))
      (let ((pos (+ (position-bytes (point)) vlf-start-pos))
            (shift-start 0)
            (shift-end 0)
            (inhibit-read-only t))
        (cond ((< end edit-end)
               (delete-region (byte-to-position (1+
                                                 (- end
                                                    vlf-start-pos)))
                              (point-max)))
              ((< edit-end end)
               (let ((edit-end-pos (point-max)))
                 (goto-char edit-end-pos)
                 (insert-file-contents buffer-file-name nil
                                       vlf-end-pos end)
                 (setq shift-end (cdr (vlf-adjust-chunk
                                       vlf-end-pos end nil t
                                       edit-end-pos))))))
        (cond ((< vlf-start-pos start)
               (delete-region (point-min) (byte-to-position
                                           (- start vlf-start-pos))))
              ((< start vlf-start-pos)
               (let ((edit-end-pos (point-max)))
                 (goto-char edit-end-pos)
                 (insert-file-contents buffer-file-name nil
                                       start vlf-start-pos)
                 (setq shift-start (car
                                    (vlf-adjust-chunk start
                                                       vlf-start-pos
                                                       t nil
                                                       edit-end-pos)))
                 (goto-char (point-min))
                 (insert (delete-and-extract-region edit-end-pos
                                                    (point-max))))))
        (setq vlf-start-pos (- start shift-start)
              vlf-end-pos (+ end shift-end))
        (goto-char (or (byte-to-position (- pos vlf-start-pos))
                       (point-max))))
      (set-buffer-modified-p modified)
      t))))

(defun vlf-move-to-chunk-2 (start end)
  "Unconditionally move to chunk determined by START END."
  (setq vlf-start-pos (max 0 start)
        vlf-end-pos (min end vlf-file-size))
  (let ((inhibit-read-only t)
        (pos (position-bytes (point))))
    (erase-buffer)
    (insert-file-contents buffer-file-name nil
                          vlf-start-pos vlf-end-pos)
    (let ((shifts (vlf-adjust-chunk vlf-start-pos vlf-end-pos t
                                     t)))
      (setq vlf-start-pos (- vlf-start-pos (car shifts))
            vlf-end-pos (+ vlf-end-pos (cdr shifts)))
      (goto-char (or (byte-to-position (+ pos (car shifts)))
                     (point-max)))))
  (set-buffer-modified-p nil)
  (set-visited-file-modtime))

(defun vlf-adjust-chunk (start end &optional adjust-start adjust-end
                                position)
  "Adjust chunk at absolute START to END till content can be \
properly decoded.  ADJUST-START determines if trying to prepend bytes\
 to the beginning, ADJUST-END - add to the end.
Use buffer POSITION as start if given.
Return number of bytes moved back for proper decoding and number of
bytes added to the end."
  (let ((position (or position (point-min)))
        (shift-start 0)
        (shift-end 0)
        (chunk-size (- end start)))
    ;; adjust beginning
    (if adjust-start
        (while (and (not (zerop start))
                    (< shift-start 4)
                    (< 4 (abs (- chunk-size
                                 (length (encode-coding-region
                                          position (point-max)
                                          buffer-file-coding-system
                                          t))))))
          (setq shift-start (1+ shift-start)
                start (1- start)
                chunk-size (1+ chunk-size))
          (delete-region position (point-max))
          (goto-char position)
          (insert-file-contents buffer-file-name nil start end)))
    ;; adjust end
    (when (and adjust-end (< end vlf-file-size))
      (let ((expected-size (buffer-size)))
        (while (and (= expected-size (buffer-size))
                    (< end vlf-file-size))
          (setq shift-end (1+ shift-end)
                end (1+ end))
          (delete-region position (point-max))
          (goto-char position)
          (insert-file-contents buffer-file-name nil start end)))
      (when (< end vlf-file-size)
        (setq shift-end (1- shift-end)
              end (1- end))
        (delete-region position (point-max))
        (goto-char position)
        (insert-file-contents buffer-file-name nil start end)))
    (cons shift-start shift-end)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; search

(defun vlf-re-search (regexp count backward batch-step)
  "Search for REGEXP COUNT number of times forward or BACKWARD.
BATCH-STEP is amount of overlap between successive chunks."
  (if (<= count 0)
      (error "Count must be positive"))
  (let* ((match-chunk-start vlf-start-pos)
         (match-chunk-end vlf-end-pos)
         (match-start-pos (+ vlf-start-pos (position-bytes (point))))
         (match-end-pos match-start-pos)
         (to-find count)
         (reporter (make-progress-reporter
                    (concat "Searching for " regexp "...")
                    (if backward
                        (- vlf-file-size vlf-end-pos)
                      vlf-start-pos)
                    vlf-file-size)))
    (set-buffer-modified-p nil)
    (buffer-disable-undo)
    (unwind-protect
        (catch 'end-of-file
          (if backward
              (while (not (zerop to-find))
                (cond ((re-search-backward regexp nil t)
                       (setq to-find (1- to-find)
                             match-chunk-start vlf-start-pos
                             match-chunk-end vlf-end-pos
                             match-start-pos (+ vlf-start-pos
                                                (position-bytes
                                                 (match-beginning 0)))
                             match-end-pos (+ vlf-start-pos
                                              (position-bytes
                                               (match-end 0)))))
                      ((zerop vlf-start-pos)
                       (throw 'end-of-file nil))
                      (t (let ((batch-move (- vlf-start-pos
                                              (- vlf-batch-size
                                                 batch-step))))
                           (vlf-move-to-batch
                            (if (< match-start-pos batch-move)
                                (- match-start-pos vlf-batch-size)
                              batch-move) t))
                         (goto-char (if (< match-start-pos
                                           vlf-end-pos)
                                        (or (byte-to-position
                                             (- match-start-pos
                                                vlf-start-pos))
                                            (point-max))
                                      (point-max)))
                         (progress-reporter-update
                          reporter (- vlf-file-size
                                      vlf-start-pos)))))
            (while (not (zerop to-find))
              (cond ((re-search-forward regexp nil t)
                     (setq to-find (1- to-find)
                           match-chunk-start vlf-start-pos
                           match-chunk-end vlf-end-pos
                           match-start-pos (+ vlf-start-pos
                                              (position-bytes
                                               (match-beginning 0)))
                           match-end-pos (+ vlf-start-pos
                                            (position-bytes
                                             (match-end 0)))))
                    ((= vlf-end-pos vlf-file-size)
                     (throw 'end-of-file nil))
                    (t (let ((batch-move (- vlf-end-pos batch-step)))
                         (vlf-move-to-batch
                          (if (< batch-move match-end-pos)
                              match-end-pos
                            batch-move) t))
                       (goto-char (if (< vlf-start-pos match-end-pos)
                                      (or (byte-to-position
                                           (- match-end-pos
                                              vlf-start-pos))
                                          (point-min))
                                    (point-min)))
                       (progress-reporter-update reporter
                                                 vlf-end-pos)))))
          (progress-reporter-done reporter))
      (set-buffer-modified-p nil)
      (if backward
          (vlf-goto-match match-chunk-start match-chunk-end
                           match-end-pos match-start-pos
                           count to-find)
        (vlf-goto-match match-chunk-start match-chunk-end
                         match-start-pos match-end-pos
                         count to-find)))))

(defun vlf-goto-match (match-chunk-start match-chunk-end
                                          match-pos-start
                                          match-pos-end
                                          count to-find)
  "Move to MATCH-CHUNK-START MATCH-CHUNK-END surrounding \
MATCH-POS-START and MATCH-POS-END.
According to COUNT and left TO-FIND, show if search has been
successful.  Return nil if nothing found."
  (if (= count to-find)
      (progn (vlf-move-to-chunk match-chunk-start match-chunk-end)
             (goto-char (or (byte-to-position (- match-pos-start
                                                 vlf-start-pos))
                            (point-max)))
             (message "Not found")
             nil)
    (let ((success (zerop to-find)))
      (if success
          (vlf-update-buffer-name)
        (vlf-move-to-chunk match-chunk-start match-chunk-end))
      (let* ((match-end (or (byte-to-position (- match-pos-end
                                                 vlf-start-pos))
                            (point-max)))
             (overlay (make-overlay (byte-to-position
                                     (- match-pos-start
                                        vlf-start-pos))
                                    match-end)))
        (overlay-put overlay 'face 'match)
        (unless success
          (goto-char match-end)
          (message "Moved to the %d match which is last"
                   (- count to-find)))
        (unwind-protect (sit-for 5)
          (delete-overlay overlay))
        t))))

(defun vlf-re-search-forward (regexp count)
  "Search forward for REGEXP prefix COUNT number of times.
Search is performed chunk by chunk in `vlf-batch-size' memory."
  (interactive (list (read-regexp "Search whole file"
                                  (if regexp-history
                                      (car regexp-history)))
                     (or current-prefix-arg 1)))
  (vlf-re-search regexp count nil (/ vlf-batch-size 8)))

(defun vlf-re-search-backward (regexp count)
  "Search backward for REGEXP prefix COUNT number of times.
Search is performed chunk by chunk in `vlf-batch-size' memory."
  (interactive (list (read-regexp "Search whole file backward"
                                  (if regexp-history
                                      (car regexp-history)))
                     (or current-prefix-arg 1)))
  (vlf-re-search regexp count t (/ vlf-batch-size 8)))

(defun vlf-goto-line (n)
  "Go to line N.  If N is negative, count from the end of file."
  (interactive "nGo to line: ")
  (let ((start-pos vlf-start-pos)
        (end-pos vlf-end-pos)
        (pos (point))
        (success nil))
    (unwind-protect
        (if (< 0 n)
            (progn (vlf-beginning-of-file)
                   (goto-char (point-min))
                   (setq success (vlf-re-search "[\n\C-m]" (1- n)
                                                 nil 0)))
          (vlf-end-of-file)
          (goto-char (point-max))
          (setq success (vlf-re-search "[\n\C-m]" (- n) t 0)))
      (if success
          (message "Onto line %s" n)
        (vlf-move-to-chunk start-pos end-pos)
        (goto-char pos)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; occur

(defvar vlf-occur-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "n" 'vlf-occur-next-match)
    (define-key map "p" 'vlf-occur-prev-match)
    (define-key map "\C-m" 'vlf-occur-visit)
    (define-key map [mouse-1] 'vlf-occur-visit)
    (define-key map "o" 'vlf-occur-show)
    map)
  "Keymap for command `vlf-occur-mode'.")

(define-derived-mode vlf-occur-mode special-mode "VLF[occur]"
  "Major mode for showing occur matches of VLF opened files.")

(defun vlf-occur-next-match ()
  "Move cursor to next match."
  (interactive)
  (if (eq (get-char-property (point) 'face) 'match)
      (goto-char (next-single-property-change (point) 'face)))
  (goto-char (or (text-property-any (point) (point-max) 'face 'match)
                 (text-property-any (point-min) (point)
                                    'face 'match))))

(defun vlf-occur-prev-match ()
  "Move cursor to previous match."
  (interactive)
  (if (eq (get-char-property (point) 'face) 'match)
      (goto-char (previous-single-property-change (point) 'face)))
  (while (not (eq (get-char-property (point) 'face) 'match))
    (goto-char (or (previous-single-property-change (point) 'face)
                   (point-max)))))

(defun vlf-occur-show (&optional event)
  "Visit current `vlf-occur' link in a vlf buffer but stay in the \
occur buffer.  If original VLF buffer has been killed,
open new VLF session each time.
EVENT may hold details of the invocation."
  (interactive (list last-nonmenu-event))
  (let ((occur-buffer (if event
                          (window-buffer (posn-window
                                          (event-end event)))
                        (current-buffer))))
    (vlf-occur-visit event)
    (pop-to-buffer occur-buffer)))

(defun vlf-occur-visit (&optional event)
  "Visit current `vlf-occur' link in a vlf buffer.
If original VLF buffer has been killed,
open new VLF session each time.
EVENT may hold details of the invocation."
  (interactive (list last-nonmenu-event))
  (when event
    (set-buffer (window-buffer (posn-window (event-end event))))
    (goto-char (posn-point (event-end event))))
  (let* ((pos (point))
         (pos-relative (- pos (line-beginning-position) 1))
         (file (get-char-property pos 'file)))
    (if file
        (let ((chunk-start (get-char-property pos 'chunk-start))
              (chunk-end (get-char-property pos 'chunk-end))
              (buffer (get-char-property pos 'buffer))
              (match-pos (+ (get-char-property pos 'line-pos)
                            pos-relative)))
          (or (buffer-live-p buffer)
              (let ((occur-buffer (current-buffer)))
                (setq buffer (vlf file))
                (switch-to-buffer occur-buffer)))
          (pop-to-buffer buffer)
          (vlf-move-to-chunk chunk-start chunk-end)
          (goto-char match-pos)))))

(defun vlf-occur (regexp)
  "Make whole file occur style index for REGEXP.
Prematurely ending indexing will still show what's found so far."
  (interactive (list (read-regexp "List lines matching regexp"
                                  (if regexp-history
                                      (car regexp-history)))))
  (let ((start-pos vlf-start-pos)
        (end-pos vlf-end-pos)
        (pos (point)))
    (vlf-beginning-of-file)
    (goto-char (point-min))
    (set-buffer-modified-p nil)
    (buffer-disable-undo)
    (unwind-protect (vlf-build-occur regexp)
      (set-buffer-modified-p nil)
      (vlf-move-to-chunk start-pos end-pos)
      (goto-char pos))))

(defun vlf-build-occur (regexp)
  "Build occur style index for REGEXP."
  (let ((line 1)
        (last-match-line 0)
        (last-line-pos (point-min))
        (file buffer-file-name)
        (total-matches 0)
        (match-end-pos (+ vlf-start-pos (position-bytes (point))))
        (occur-buffer (generate-new-buffer
                       (concat "*VLF-occur " (file-name-nondirectory
                                               buffer-file-name)
                               "*")))
        (line-regexp (concat "\\(?5:[\n\C-m]\\)\\|\\(?10:"
                             regexp "\\)"))
        (batch-step (/ vlf-batch-size 8))
        (end-of-file nil)
        (reporter (make-progress-reporter
                   (concat "Building index for " regexp "...")
                   vlf-start-pos vlf-file-size)))
    (unwind-protect
        (progn
          (while (not end-of-file)
            (if (re-search-forward line-regexp nil t)
                (progn
                  (setq match-end-pos (+ vlf-start-pos
                                         (position-bytes
                                          (match-end 0))))
                  (if (match-string 5)
                      (setq line (1+ line) ; line detected
                            last-line-pos (point))
                    (let* ((chunk-start vlf-start-pos)
                           (chunk-end vlf-end-pos)
                           (vlf-buffer (current-buffer))
                           (line-pos (line-beginning-position))
                           (line-text (buffer-substring
                                       line-pos (line-end-position))))
                      (with-current-buffer occur-buffer
                        (unless (= line last-match-line) ;new match line
                          (insert "\n:") ; insert line number
                          (let* ((overlay-pos (1- (point)))
                                 (overlay (make-overlay
                                           overlay-pos
                                           (1+ overlay-pos))))
                            (overlay-put overlay 'before-string
                                         (propertize
                                          (number-to-string line)
                                          'face 'shadow)))
                          (insert (propertize line-text ; insert line
                                              'file file
                                              'buffer vlf-buffer
                                              'chunk-start chunk-start
                                              'chunk-end chunk-end
                                              'mouse-face '(highlight)
                                              'line-pos line-pos
                                              'help-echo
                                              (format "Move to line %d"
                                                      line))))
                        (setq last-match-line line
                              total-matches (1+ total-matches))
                        (let ((line-start (1+
                                           (line-beginning-position)))
                              (match-pos (match-beginning 10)))
                          (add-text-properties ; mark match
                           (+ line-start match-pos (- last-line-pos))
                           (+ line-start (match-end 10)
                              (- last-line-pos))
                           (list 'face 'match
                                 'help-echo
                                 (format "Move to match %d"
                                         total-matches))))))))
              (setq end-of-file (= vlf-end-pos vlf-file-size))
              (unless end-of-file
                (let ((batch-move (- vlf-end-pos batch-step)))
                  (vlf-move-to-batch (if (< batch-move match-end-pos)
                                          match-end-pos
                                        batch-move) t))
                (goto-char (if (< vlf-start-pos match-end-pos)
                               (or (byte-to-position (- match-end-pos
                                                        vlf-start-pos))
                                   (point-min))
                             (point-min)))
                (setq last-match-line 0
                      last-line-pos (line-beginning-position))
                (progress-reporter-update reporter vlf-end-pos))))
          (progress-reporter-done reporter))
      (if (zerop total-matches)
          (progn (with-current-buffer occur-buffer
                   (set-buffer-modified-p nil))
                 (kill-buffer occur-buffer)
                 (message "No matches for \"%s\"" regexp))
        (with-current-buffer occur-buffer
          (goto-char (point-min))
          (insert (propertize
                   (format "%d matches from %d lines for \"%s\" \
in file: %s" total-matches line regexp file)
                   'face 'underline))
          (set-buffer-modified-p nil)
          (forward-char 2)
          (vlf-occur-mode))
        (display-buffer occur-buffer)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; editing

(defvar vlf-edit-mode-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map text-mode-map)
    (define-key map "\C-c\C-c" 'vlf-write)
    (define-key map "\C-c\C-q" 'vlf-discard-edit)
    (define-key map "\C-v" vlf-mode-map)
    map)
  "Keymap for command `vlf-edit-mode'.")

(define-derived-mode vlf-edit-mode vlf-mode "VLF[edit]"
  "Major mode for editing large file chunks."
  (setq buffer-read-only nil)
  (buffer-enable-undo)
  (message (substitute-command-keys
            "Editing: Type \\[vlf-write] to write chunk \
or \\[vlf-discard-edit] to discard changes.")))

(defun vlf-discard-edit ()
  "Discard edit and refresh chunk from file."
  (interactive)
  (set-buffer-modified-p nil)
  (vlf-move-to-chunk vlf-start-pos vlf-end-pos)
  (vlf-mode)
  (message "Switched to VLF mode."))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; saving

(defun vlf-write ()
  "Write current chunk to file.  Always return true to disable save.
If changing size of chunk, shift remaining file content."
  (interactive)
  (when (and (buffer-modified-p)
             (or (verify-visited-file-modtime (current-buffer))
                 (y-or-n-p "File has changed since visited or saved.  \
Save anyway? ")))
    (let ((pos (point))
          (size-change (- vlf-end-pos vlf-start-pos
                          (length (encode-coding-region
                                   (point-min) (point-max)
                                   buffer-file-coding-system t)))))
      (cond ((zerop size-change)
             (write-region nil nil buffer-file-name vlf-start-pos t))
            ((< 0 size-change)
             (vlf-file-shift-back size-change))
            (t (vlf-file-shift-forward (- size-change))))
      (vlf-move-to-chunk-2 vlf-start-pos vlf-end-pos)
      (goto-char pos))
    (vlf-mode))
  t)

(defun vlf-file-shift-back (size-change)
  "Shift file contents SIZE-CHANGE bytes back."
  (write-region nil nil buffer-file-name vlf-start-pos t)
  (buffer-disable-undo)
  (let ((read-start-pos vlf-end-pos)
        (coding-system-for-write 'no-conversion)
        (reporter (make-progress-reporter "Adjusting file content..."
                                          vlf-end-pos
                                          vlf-file-size)))
    (while (vlf-shift-batch read-start-pos (- read-start-pos
                                               size-change))
      (setq read-start-pos (+ read-start-pos vlf-batch-size))
      (progress-reporter-update reporter read-start-pos))
    ;; pad end with space
    (erase-buffer)
    (vlf-verify-size)
    (insert-char 32 size-change)
    (write-region nil nil buffer-file-name (- vlf-file-size
                                              size-change) t)
    (progress-reporter-done reporter)))

(defun vlf-shift-batch (read-pos write-pos)
  "Read `vlf-batch-size' bytes from READ-POS and write them \
back at WRITE-POS.  Return nil if EOF is reached, t otherwise."
  (erase-buffer)
  (vlf-verify-size)
  (let ((read-end (+ read-pos vlf-batch-size)))
    (insert-file-contents-literally buffer-file-name nil
                                    read-pos
                                    (min vlf-file-size read-end))
    (write-region nil nil buffer-file-name write-pos 0)
    (< read-end vlf-file-size)))

(defun vlf-file-shift-forward (size-change)
  "Shift file contents SIZE-CHANGE bytes forward.
Done by saving content up front and then writing previous batch."
  (buffer-disable-undo)
  (let ((size (+ vlf-batch-size size-change))
        (read-pos vlf-end-pos)
        (write-pos vlf-start-pos)
        (reporter (make-progress-reporter "Adjusting file content..."
                                          vlf-start-pos
                                          vlf-file-size)))
    (when (vlf-shift-batches size read-pos write-pos t)
      (setq write-pos (+ read-pos size-change)
            read-pos (+ read-pos size))
      (progress-reporter-update reporter write-pos)
      (let ((coding-system-for-write 'no-conversion))
        (while (vlf-shift-batches size read-pos write-pos nil)
          (setq write-pos (+ read-pos size-change)
                read-pos (+ read-pos size))
          (progress-reporter-update reporter write-pos))))
    (progress-reporter-done reporter)))

(defun vlf-shift-batches (size read-pos write-pos hide-read)
  "Append SIZE bytes of file starting at READ-POS.
Then write initial buffer content to file at WRITE-POS.
If HIDE-READ is non nil, temporarily hide literal read content.
Return nil if EOF is reached, t otherwise."
  (vlf-verify-size)
  (let ((read-more (< read-pos vlf-file-size))
        (start-write-pos (point-min))
        (end-write-pos (point-max)))
    (when read-more
      (goto-char end-write-pos)
      (insert-file-contents-literally buffer-file-name nil read-pos
                                      (min vlf-file-size (+ read-pos
                                                             size))))
    ;; write
    (if hide-read ; hide literal region if user has to choose encoding
        (narrow-to-region start-write-pos end-write-pos))
    (write-region start-write-pos end-write-pos
                  buffer-file-name write-pos 0)
    (delete-region start-write-pos end-write-pos)
    (if hide-read (widen))
    read-more))

(provide 'vlf)

;;; vlf.el ends here

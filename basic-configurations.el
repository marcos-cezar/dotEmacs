;; UTF-8 default coding-system
(setq locale-coding-system 'utf-8) 
(set-terminal-coding-system 'utf-8) 
(set-keyboard-coding-system 'utf-8) 
(set-selection-coding-system 'utf-8) 
(prefer-coding-system 'utf-8) 

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

(setq jump-char-lazy-highlight-face nil)

(setq fill-column 80)

(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent

(winner-mode 1)

(set-default 'indicate-empty-lines t)

(require 'smooth-scrolling)
(setq enable-recursive-minibuffers t)

(setq gc-cons-threshold 20000000)

(setq org-src-fontify-natively t)

(global-undo-tree-mode)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; A saner ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;; When popping the mark, continue popping until the cursor actually moves
;; Also, if the last command was a copy - skip past all the expand-region cruft.
(defadvice pop-to-mark-command (around ensure-new-position activate)
  (let ((p (point)))
    (when (eq last-command 'save-region-or-current-line)
      ad-do-it
      ad-do-it
      ad-do-it)
    (dotimes (i 10)
      (when (= p (point)) ad-do-it))))

(global-set-key (kbd "C-M-z") 'undo-tree-undo)
(global-set-key (kbd "C-M-S-z") 'undo-tree-redo)
 
(add-to-list 'default-frame-alist '(height . 45))
    (add-to-list 'default-frame-alist '(width . 140))

(require 'smartparens)
(add-hook 'prog-mode-hook 'smartparens-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq initial-frame-alist '((top . 10) (left . 40)))

(setq system-uses-terminfo nil)
(windmove-default-keybindings)

(setq-default indent-tabs-mode nil)
(setq-default truncate-lines nil)
(setq-default truncate-partial-width-windows nil)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name dir-name))
  )

(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(defun colorize-compilation-buffer ()
  (interactive)
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
 
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(provide 'basic-configurations)

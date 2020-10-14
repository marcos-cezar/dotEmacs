
(setq font-lock-maximum-decoration t
      ;; color-theme-is-global t
      truncate-partial-width-windows nil)

;; (set-frame-font "Ubuntu Mono-14")
(set-frame-font "Hack Nerd Font:pixelsize=18")
(setq-default line-spacing 1)
(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(require 'doom-modeline)
(doom-modeline-mode 1)

(setq ns-use-srgb-colorspace nil)


(global-visual-line-mode t)
(delete-selection-mode t)
(blink-cursor-mode t)
(show-paren-mode t)

(setq make-backup-file nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)


(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 120))
           (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
         (cons 'height (/ (- (x-display-pixel-height) 200)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)


;; UTF-8 
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; (setq default-frame-alist
;;       '(
;;         (width . 135) ; character
;;         (height . 52) ; lines
;;         ))
;; (add-to-list 'default-frame-alist '(height . 45))
;; (add-to-list 'default-frame-alist '(width . 155))
(blink-cursor-mode -1)

(setq is-linux (equal system-type 'gnu/linux))

(require 'dash)

(when is-linux
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize)
  (setq insert-directory-program (executable-find "ls")))


;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

(smartparens-global-mode t)
(global-set-key (kbd "M-x") 'smex)

(column-number-mode t)
(setq make-backup-files nil)



;; (global-set-key "\C-cd" 'dash-at-point)
;; (global-set-key "\C-ce" 'dash-at-point-with-docset)

(require 'setup-multiple-cursors)

(setq make-backup-files nil)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(set-fringe-mode 0)

(setq projectile-tags-command "ctags-exuberant -Re -f \"%s\" %s")

;; (require 'o-blog)

(global-set-key (kbd "M-n") (lambda () (interactive) (join-line -1)))
(require 'org)

(require 'gradle-mode)
(gradle-mode 1)

(require 'wgrep)
(require 'pt)


(setq dired-dwim-target t)

(require 'peep-dired)

(setq key-chord-two-keys-delay 0.1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(require 'visual-regexp)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)

(setq-default frame-title-format '("%f [%m]"))
(when (string= system-type "darwin")       
  (setq dired-use-ls-dired nil))
;; (require 'setup-quickrun)
(provide 'setup-defaults)


(setq font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; (set-frame-font "Ubuntu Mono-14")
(set-frame-font "Hack:pixelsize=18")
(setq-default line-spacing 1)
(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(global-visual-line-mode t)
(delete-selection-mode t)
(blink-cursor-mode t)
(show-paren-mode t)

(setq make-backup-file nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)


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
  (setq insert-directory-program (executable-find "gls")))


;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

(smartparens-global-mode t)
(global-set-key (kbd "M-x") 'smex)

;;; Nice size for the default window
(defun get-default-height ()
       (/ (- (display-pixel-height) 100)
          (frame-char-height)))

(add-to-list 'default-frame-alist '(width . 164))
(add-to-list 'default-frame-alist (cons 'height (get-default-height)))

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

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; (require 'o-blog)

(global-set-key (kbd "M-n") (lambda () (interactive) (join-line -1)))
(require 'org)

(require 'gradle-mode)
(gradle-mode 1)

(require 'wgrep)
(require 'pt)


(setq dired-dwim-target t)


(require 'spaceline-config)
(spaceline-spacemacs-theme)
(provide 'setup-defaults)

(require 'peep-dired)

(setq key-chord-two-keys-delay 0.1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; (require 'setup-quickrun)

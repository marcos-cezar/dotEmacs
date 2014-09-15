
(setq font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

(set-frame-font "Source Code Pro for Powerline-14")
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; UTF-8 please
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

(setq is-mac (equal system-type 'darwin))

(require 'dash)

(when is-mac
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))


;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

(smartparens-global-mode t)
(global-set-key (kbd "M-x") 'smex)

(provide 'setup-defaults)

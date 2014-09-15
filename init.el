
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-to-list 'load-path (concat user-emacs-directory "vendor/org-mode/lisp"))
(add-to-list 'load-path (concat user-emacs-directory "lisp"))


(require 'setup-defaults)

(global-set-key (kbd "C-@") 'er/expand-region)

(require 'setup-ido)

;;configuring ace-jump-mode
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;;configuring saveplace
(require 'saveplace)
(setq save-place-file (concat user-emacs-directory "saveplace.el"))
(setq-default save-place t)

;;configuring indent-mode
(electric-indent-mode t)

(require 'auto-complete-config)
(ac-config-default)

(yas-global-mode t)
(projectile-global-mode)

(require 'smartparens-config)
(require 'setup-defuns)
(require 'mode-mappings)
(require 'setup-ruby)
(require 'setup-shell)



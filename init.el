

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; (setq package-enable-at-startup nil)
;; 

;;(require 'Dired+ "~/.emacs.d/vendor/Dired+.el")
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(setq warning-minimum-level :emergency)
(add-to-list 'load-path (concat user-emacs-directory "vendor"))
(add-to-list 'load-path (concat user-emacs-directory "vendor/org-mode/lisp"))
(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/custom-functions"))

;; (require 'Dired+)

(require 'setup-defaults)

(global-set-key (kbd "C-@") 'er/expand-region)

(require 'setup-ido)

;;configuring ace-jump-mode
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;;configuring saveplace
(require 'saveplace)
(setq save-place-file (concat user-emacs-directory "saveplace.el"))
(setq-default save-place t)


;; (require 'auto-complete-config)
;; (ac-config-default)

(yas-global-mode t)
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(require 'smartparens-config)
(require 'setup-defuns)
(require 'mode-mappings)
(require 'setup-ruby)
(require 'setup-shell)


(load-theme 'base16-default-dark t)

(put 'upcase-region 'disabled nil)

(use-package scala-mode
  :interpreter
  ("scala" . scala-mode))

(put 'dired-find-alternate-file 'disabled nil)

(require 'iso-transl)
(put 'set-goal-column 'disabled nil)

(require 'setup-macros)
(require 'setup-company)
(require 'setup-avy)
(require 'setup-elisp)
(require 'setup-smart-mode-line)
(require 'setup-beacon)
(require 'un-to-camelcase)
(require 'setup-org)
(require 'setup-indentation)
;; (require 'setup-icicles)

(require 'setup-clojure)

(require 'use-package)
(require 'setup-ensime)
(use-package smart-comment
  :bind ("M-;" . smart-comment))

(use-package ace-window :bind ("M-p" . ace-window))
(dired-async-mode 1)
;; (require 'setup-key-chord)
(put 'scroll-left 'disabled nil)

(require 'setup-web)
(require 'setup-magit)			

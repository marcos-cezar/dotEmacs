

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/") 
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-to-list 'load-path (concat user-emacs-directory "vendor/org-mode/lisp"))
(add-to-list 'load-path (concat user-emacs-directory "vendor/kotlin-mode"))
(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/custom-functions"))

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
(require 'dired+)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(package-selected-packages (quote (package-build shut-up epl git commander f dash s))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
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

;;(require 'kotlin-mode)		   

(require 'setup-kotlin)
(require 'kotlin-mode)
(require 'setup-clojure)

;;(require 'setup-kotlin)
(require 'use-package)
(require 'setup-ensime)
(use-package smart-comment
  :bind ("M-;" . smart-comment))

(use-package ace-window :bind ("M-p" . ace-window))
(dired-async-mode 1)

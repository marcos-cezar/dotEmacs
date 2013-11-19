

(setq emacs-home "~/.emacs.d/")
(setq vendor-path (concat emacs-home "vendor/"))
;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

(load (concat vendor-path "better-defaults/better-defaults.el"))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)


(require 'cl)
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;;(when is-mac (require 'mac))

(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))

(require 'server)
(unless (server-running-p)
  (server-start))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(autoload 'flycheck-mode "setup-flycheck" nil t)
(autoload 'auto-complete-mode "auto-complete" nil t)

;; Install extensions if they're missing
;; (defun init--install-packages ()
;;   (packages-install
;;    '(magit
;;      paredit
;;      move-text
;;      god-mode
;;      gist
;;      htmlize
;;      visual-regexp
;;      flycheck
;;      flx
;;      flx-ido
;;      smartparens
;;      ido-vertical-mode
;;      ido-at-point
;;      simple-httpd
;;      guide-key
;;      nodejs-repl
;;      restclient
;;      highlight-escape-sequences
;;      elisp-slime-nav
;;      git-commit-mode
;;      gitconfig-mode
;;      gitignore-mode
;;      clojure-mode
;;      nrepl)))

;; (condition-case nil
;;     (init--install-packages)
;;   (error
;;    (package-refresh-contents)
;;    (init--install-packages)))

(add-to-list 'load-path emacs-home)

(eval-after-load 'ido '(require 'setup-ido))
(require 'setup-org)
(require 'setup-dired)
(require 'setup-yasnippet)

(require 'setup-hippie)

(require 'setup-shell)
(require 'setup-paredit)

;; Default setup of smartparens
(require 'smartparens-config)
(setq sp-autoescape-string-quote nil)
(--each '(css-mode-hook
          restclient-mode-hook
          js-mode-hook
          cc-mode-hook
          markdown-mode)
  (add-hook it 'turn-on-smartparens-mode))

(eval-after-load 'ruby-mode '(require 'setup-ruby-mode))
(eval-after-load 'markdown-mode '(require 'setup-markdown-mode))

(require 'setup-flycheck)

(set-face-attribute 'default nil :family "Menlo")
(set-face-attribute 'default nil :height 140)

(autoload 'auto-complete-mode "auto-complete" nil t)

;; Visual regexp
(require 'visual-regexp)
(define-key global-map (kbd "M-&") 'vr/query-replace)
(define-key global-map (kbd "M-/") 'vr/replace)

(require 'expand-region)
(require 'multiple-cursors)
(require 'jump-char)
(require 'eproject)
(require 'wgrep)
(require 'smart-forward)
(require 'change-inner)
(require 'multifiles)

;; Browse kill ring
(require 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)

;; Smart M-x is smart
(require 'smex)
(smex-initialize)

(require 'mac-default)

(require 'crappy-jsp-mode)

(require 'modes-config)

(require 'undo-tree)
(define-key global-map (kbd "C-?") 'undo-tree-redo)

(require 'misc)

(require 'basic-configurations)

(require 'dired+)

(require 'projectile)
(global-set-key (kbd "C-c h") 'helm-projectile) 

(require 'key-chord)


(require 'setup-html)

(require 'iedit)

(require 'setup-magit)

(add-to-list 'load-path (concat vendor-path "delsel"))
(require 'delsel)

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)


(require 'auto-complete-config)
(ac-config-default)

(require 'zoom-frm)

(require 'top-mode)

(load-theme 'base16-default t)

(require 'rainbow-mode)

(setq yas-snippet-dirs '((concat emacs-home "snippets")))

(require 'ido-yes-or-no)

(require 'auto-complete-clang)
(global-set-key (kbd "C-x a") 'ac-complete-clang)


(require 'org-latex)
(add-to-list 'org-export-latex-classes
             '("IEEEtran"
               "\\documentclass{IEEEtran}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(require 'org-special-blocks)

(org-add-link-type "ebib" 'ebib)

(setq locate-command "mdfind")

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

(require 'js2-refactor)
(require 'wgrep)
(put 'set-goal-column 'disabled nil)

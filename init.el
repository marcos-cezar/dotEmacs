

(setq emacs-home "~/.emacs.d/")
(setq vendor-path (concat emacs-home "vendor/"))
;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

(load (concat vendor-path "better-defaults/better-defaults.el"))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("ELPA"      . "http://tromey.com/elpa/")
                         ("Org-Mode" . "http://orgmode.org/elpa/")))
(package-initialize)


(require 'cl)
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)


(when is-mac (require 'mac))

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

(set-face-attribute 'default nil :family "Monaco")
(set-face-attribute 'default nil :height 120)


;; Visual regexp
(require 'visual-regexp)
(define-key global-map (kbd "M-&") 'vr/query-replace)
(define-key global-map (kbd "M-/") 'vr/replace)

(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)

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

(require 'setup-projectile)

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
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


(require 'auto-complete-config)
(ac-config-default)

(require 'zoom-frm)

(require 'top-mode)

(load-theme 'solarized-dark t)

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
(put 'set-goal-column 'disabled nil)

(require 'keybindings)


(eval-after-load "etags"
  '(progn
      (ac-etags-setup)))

(add-hook 'c-mode-common-hook 'ac-etags-ac-setup)
(add-hook 'ruby-mode-common-hook 'ac-etags-ac-setup)

(defadvice find-tag (before c-tag-file activate) 
  "Automatically create tags file."
  (let ((tag-file (concat default-directory "TAGS")))
    (unless (file-exists-p tag-file)
      (shell-command "etags *.[ch] *.java -o TAGS 2>/dev/null"))
    (visit-tags-table tag-file)))

;; (require 'ahg)

(setq c-default-style "k&r" c-basic-offset 4)

;; (require 'ascope)

(require 'setup-el-get)

(require 'member-function)
(setq mf--source-file-extension "cpp")

(add-to-list 'load-path (concat vendor-path "includeme"))
(require 'includeme)
(define-key c-mode-base-map (kbd "C-c o") 'includeme)

(require 'setup-company-mode)

(require 'setup-jde)

(require 'ctags-update)
(ctags-auto-update-mode t)

;; (add-to-list 'load-path (concat vendor-path "clang-completion-mode"))
;; (load-library "clang-completion-mode")

(eval-after-load 'company
  '(define-key company-active-map (kbd "C-:") 'helm-company))

;; (defun my-ac-cc-mode-setup ()
;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))

;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; (setq sml/theme 'dark)
;; (sml/setup)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (require 'setup-irony)

(require 'setup-clang-async)


(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)

(require 'semantic/ia)
(require 'semantic/bovine/gcc)

;; ;; if you want to enable support for gnu global
;; (when (cedet-gnu-global-version-check t)
;;   (semanticdb-enable-gnu-global-databases 'c-mode)
;;   (semanticdb-enable-gnu-global-databases 'c++-mode))

;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
;; (when (cedet-ectag-version-check)
;;   (semantic-load-enable-primary-exuberent-ctags-support))

(put 'dired-find-alternate-file 'disabled nil)

(require 'setup-latex)
(setq ns-use-srgb-colorspace nil)

(require 'android-mode)

;; (require 'malabar-mode)
;; (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))
(require 'ag)
(require 'dash-at-point)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

(require 'setup-web-mode)
(require 'dirtree)

;; Emacs lisp
(add-to-list 'auto-mode-alist '("Carton$" . emacs-lisp-mode))

;; Restclient
(add-to-list 'auto-mode-alist '("\\.restclient$" . restclient-mode))

(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tag$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.vm$" . html-mode))


;; JSP
(autoload 'crappy-jsp-mode "crappy-jsp-mode")
(add-to-list 'auto-mode-alist '("\\.jsp$" . crappy-jsp-mode))
(add-to-list 'auto-mode-alist '("\\.jspf$" . crappy-jsp-mode))

;; Ruby
(autoload 'rhtml-mode "rhtml-mode")
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.watchr$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))

(add-hook 'ruby-mode-hook 'ruby-end-mode)

;; Snippets
(add-to-list 'auto-mode-alist '("yasnippet/snippets" . snippet-mode))
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

;; Markdown
(autoload 'markdown-mode "markdown-mode")
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-hook 'markdown-mode-hook (lambda () (define-key markdown-mode-map (kbd "<tab>") 'yas/expand)))

;; org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(provide 'modes-config)

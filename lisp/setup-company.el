
(use-package company
  :ensure t)
(add-hook 'after-init-hook 'global-company-mode)

(global-set-key "\t" 'company-complete-common)
(setq company-idle-delay 0)


(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (set
				   (make-local-variable 'company-backends)
				   '((company-elisp :with company-dabbrev-code)))))

;(company-quickhelp-mode 1)

(provide 'setup-company)

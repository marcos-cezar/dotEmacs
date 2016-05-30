;;configuring indent-mode
;; (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)

;; (global-aggressive-indent-mode 1)
;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode) 

;; (add-to-list
;;  'aggressive-indent-dont-indent-if
;;  '(and (derived-mode-p 'c++-mode)
;;        (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
;;                            (thing-at-point 'line)))))


;; (add-to-list
;;  'aggressive-indent-dont-indent-if
;;  '(and (derived-mode-p 'java-mode)
;;        (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
;;                            (thing-at-point 'line)))))

(electric-indent-mode t)
(provide 'setup-indentation)

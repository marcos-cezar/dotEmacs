(add-to-list 'load-path (concat vendor-path "jdee-2.4.1/lisp"))
(load "jde")

(push 'jde-mode ac-modes)
(add-hook 'jde-mode-hook (lambda () (push 'ac-source-semantic ac-sources)))

(provide 'setup-jde)



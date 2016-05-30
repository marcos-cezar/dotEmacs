
;; Função que transforma uma entrada de variável com underscore para camelcase.
(defun un-to-camelcase (str)
  (interactive "s")
  (let ((value)
	(result "")
	(i 0)) (dolist (current-word (split-string str "_") value)
		 (if (> i 0)
		     (setq result (format "%s%s" result (capitalize current-word)))
		   (setq result (format "%s%s" result current-word)))
		 (setq value (cons current-word value))
		 (setq i (1+ i)))
	(insert result)))


(provide 'un-to-camelcase)

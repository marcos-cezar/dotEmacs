(fset 'un-to-camelcase
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([19 95 return 134217827 134217826 2 4] 0 "%d")) arg)))

(global-set-key (kbd "C-c u c") 'un-to-camelcase)

(provide 'setup-macros)

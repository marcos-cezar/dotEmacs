
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-l") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-c C-n") 'mc/insert-numbers)


(global-set-key (kbd "C-c C-t") 'mc/reverse-regions)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

(provide 'setup-multiple-cursors)

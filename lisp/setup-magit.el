

(add-to-list 'load-path (concat user-emacs-directory "vendor/magit"))
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

(global-set-key (kbd "C-x g") 'magit-status)


(provide 'setup-magit)

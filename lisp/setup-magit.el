

(add-to-list 'load-path (concat user-emacs-directory "vendor/magit"))
(use-package magit-gitflow
  :ensure t)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

(global-set-key (kbd "C-x g") 'magit-status)


(provide 'setup-magit)

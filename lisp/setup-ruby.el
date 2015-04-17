(setq ruby-deep-indent-paren nil)

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(global-set-key (kbd "C-c r r") 'inf-ruby)

(global-set-key (kbd "C-c r a") 'rvm-activate-corresponding-ruby)

(add-hook 'ruby-mode-hook 'projectile-on)

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(global-company-mode t)
(push 'company-robe company-backends)



(provide 'setup-ruby)

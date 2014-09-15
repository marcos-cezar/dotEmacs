;;configuring ido-mode
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-use-faces nil)

(require 'ido-vertical-mode)
(ido-vertical-mode)

(ido-ubiquitous-mode 1)

(provide 'setup-ido)

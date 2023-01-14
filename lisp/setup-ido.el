;;configuring ido-mode
(use-package flx-ido
  :ensure t)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-use-faces nil)

(use-package ido-vertical-mode
  :ensure t)
(ido-vertical-mode)

(use-package ido-completing-read+
  :ensure t
  :init
  (ido-ubiquitous-mode 1))

(use-package amx
  :ensure t
  :init
  (amx-mode 1))

(use-package ido-yes-or-no
  :ensure t
  :init
  (ido-yes-or-no-mode 1))

(provide 'setup-ido)

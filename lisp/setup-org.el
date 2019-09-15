(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(require 'ob-dart)
(add-to-list 'org-babel-load-languages  '(dart . t))

(provide 'setup-org)

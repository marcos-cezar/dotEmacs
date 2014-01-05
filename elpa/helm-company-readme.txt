Add the following to your Emacs init file:

(autoload 'helm-company "helm-company") ;; Not necessary if using ELPA package
(eval-after-load 'company
  '(define-key company-active-map (kbd "C-:") 'helm-company))

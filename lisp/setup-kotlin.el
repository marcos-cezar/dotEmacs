

(add-hook 'kotlin-mode-hook
          (lambda ()
           (electric-indent-mode)))

(add-hook 'kotlin-mode-hook
          (lambda ()
            (require 'cc-cmds)
            (setf indent-line-function #'c-indent-line)))
(provide 'setup-kotlin)

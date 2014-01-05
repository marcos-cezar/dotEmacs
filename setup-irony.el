(add-to-list 'load-path (concat vendor-path "irony-mode/elisp/"))
(require 'irony)

;; (irony-enable 'ac)

;; (defun my-c++-hooks ()
;;   "Enable the hooks in the preferred order: 'yas -> auto-complete -> irony'."
;;   ;; if yas is not set before (auto-complete-mode 1), overlays may persist after
;;   ;; an expansion.
;;   (yas/minor-mode-on)
;;   (auto-complete-mode 1)

;;   ;; avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode
;;   (when (member major-mode irony-known-modes)
;;     (irony-mode 1)))

;; (add-hook 'c++-mode-hook 'my-c++-hooks)
;; (add-hook 'c-mode-hook 'my-c++-hooks)

(provide init-irony-mode)

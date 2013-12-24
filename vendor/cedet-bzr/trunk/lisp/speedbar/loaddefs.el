;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (rpm) "rpm" "rpm.el" (20580 44388))
;;; Generated autoloads from rpm.el

(autoload (quote rpm) "rpm" "\
Red Hat Package Management in Emacs.

\(fn)" t nil)

;;;***

;;;### (autoloads (Info-speedbar-buttons Info-speedbar-browser) "sb-info"
;;;;;;  "sb-info.el" (20580 44388))
;;; Generated autoloads from sb-info.el

(autoload (quote Info-speedbar-browser) "sb-info" "\
Initialize speedbar to display an info node browser.
This will add a speedbar major display mode.

\(fn)" t nil)

(autoload (quote Info-speedbar-buttons) "sb-info" "\
Create a speedbar display to help navigation in an Info file.
BUFFER is the buffer speedbar is requesting buttons for.

\(fn BUFFER)" nil nil)

(eval-after-load "info" (quote (require (quote sb-info))))

;;;***

;;;### (autoloads (rmail-speedbar-buttons) "sb-rmail" "sb-rmail.el"
;;;;;;  (20580 44388))
;;; Generated autoloads from sb-rmail.el

(autoload (quote rmail-speedbar-buttons) "sb-rmail" "\
Create buttons for BUFFER containing rmail messages.
Click on the address under Reply to: to reply to this person.
Under Folders: Click a name to read it, or on the <M> to move the
current message into that RMAIL folder.

\(fn BUFFER)" nil nil)

;;;***

;;;### (autoloads nil nil ("sb-ant.el" "sb-html.el" "sb-texinfo.el")
;;;;;;  (21169 32245 882924))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; loaddefs.el ends here

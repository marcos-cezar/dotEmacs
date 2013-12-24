;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (srecode-semantic-handle-:android) "android" "android.el"
;;;;;;  (20580 44388))
;;; Generated autoloads from android.el

(autoload (quote srecode-semantic-handle-:android) "android" "\
Add android specific symbols into DICT based on the current project.

\(fn DICT)" nil nil)

;;;***

;;;### (autoloads (srecode-compile-templates) "compile" "compile.el"
;;;;;;  (20824 34742))
;;; Generated autoloads from compile.el

(autoload (quote srecode-compile-templates) "compile" "\
Compile a semantic recode template file into a mode-local variable.

\(fn)" t nil)

;;;***

;;;### (autoloads (srecode-semantic-handle-:cpp srecode-semantic-handle-:c)
;;;;;;  "cpp" "cpp.el" (20728 47804))
;;; Generated autoloads from cpp.el

(autoload (quote srecode-semantic-handle-:c) "cpp" "\
Add macros into the dictionary DICT based on the current c file.
Adds the following:
FILENAME_SYMBOL - filename converted into a C compat symbol.
HEADER - Shown section if in a header file.

\(fn DICT)" nil nil)

(autoload (quote srecode-semantic-handle-:cpp) "cpp" "\
Add macros into the dictionary DICT based on the current c file.
Calls `srecode-semantic-handle-:c.
Also adds the following:
 - nothing -

\(fn DICT)" nil nil)

;;;***

;;;### (autoloads (srecode-document-insert-group-comments srecode-document-insert-variable-one-line-comment
;;;;;;  srecode-document-insert-function-comment srecode-document-insert-comment)
;;;;;;  "document" "document.el" (20746 56154))
;;; Generated autoloads from document.el

(autoload (quote srecode-document-insert-comment) "document" "\
Insert some comments.
Whack any comments that may be in the way and replace them.
If the region is active, then insert group function comments.
If the cursor is in a comment, figure out what kind of comment it is
  and replace it.
If the cursor is in a function, insert a function comment.
If the cursor is on a one line prototype, then insert post-fcn comments.

\(fn)" t nil)

(autoload (quote srecode-document-insert-function-comment) "document" "\
Insert or replace a function comment.
FCN-IN is the Semantic tag of the function to add a comment too.
If FCN-IN is not provided, the current tag is used instead.
It is assumed that the comment occurs just in front of FCN-IN.

\(fn &optional FCN-IN)" t nil)

(autoload (quote srecode-document-insert-variable-one-line-comment) "document" "\
Insert or replace a variable comment.
VAR-IN is the Semantic tag of the function to add a comment too.
If VAR-IN is not provided, the current tag is used instead.
It is assumed that the comment occurs just after VAR-IN.

\(fn &optional VAR-IN)" t nil)

(autoload (quote srecode-document-insert-group-comments) "document" "\
Insert group comments around the active between BEG and END.
If the region includes only parts of some tags, expand out
to the beginning and end of the tags on the region.
If there is only one tag in the region, complain.

\(fn BEG END)" t nil)

;;;***

;;;### (autoloads (srecode-semantic-handle-:el-custom srecode-semantic-handle-:el)
;;;;;;  "el" "el.el" (20746 56154))
;;; Generated autoloads from el.el

(autoload (quote srecode-semantic-handle-:el) "el" "\
Add macros into the dictionary DICT based on the current Emacs Lisp file.
Adds the following:
  PRENAME - The common name prefix of this file.

\(fn DICT)" nil nil)

(autoload (quote srecode-semantic-handle-:el-custom) "el" "\
Add macros into the dictionary DICT based on the current Emacs Lisp file.
Adds the following:
  GROUP - The 'defgroup' name we guess you want for variables.
  FACEGROUP - The `defgroup' name you might want for faces.

\(fn DICT)" nil nil)

;;;***

;;;### (autoloads (srecode-insert-prototype-expansion) "expandproto"
;;;;;;  "expandproto.el" (20746 56154))
;;; Generated autoloads from expandproto.el

(autoload (quote srecode-insert-prototype-expansion) "expandproto" "\
Insert get/set methods for the current class.

\(fn)" t nil)

;;;***

;;;### (autoloads (srecode-insert-getset) "getset" "getset.el" (20746
;;;;;;  56154))
;;; Generated autoloads from getset.el

(autoload (quote srecode-insert-getset) "getset" "\
Insert get/set methods for the current class.
CLASS-IN is the semantic tag of the class to update.
FIELD-IN is the semantic tag, or string name, of the field to add.
If you do not specify CLASS-IN or FIELD-IN then a class and field
will be derived.

\(fn &optional CLASS-IN FIELD-IN)" t nil)

;;;***

;;;### (autoloads (srecode-insert) "insert" "insert.el" (20779 52264))
;;; Generated autoloads from insert.el

(autoload (quote srecode-insert) "insert" "\
Insert the template TEMPLATE-NAME into the current buffer at point.
DICT-ENTRIES are additional dictionary values to add.

\(fn TEMPLATE-NAME &rest DICT-ENTRIES)" t nil)

;;;***

;;;### (autoloads (srecode-semantic-handle-:java) "java" "java.el"
;;;;;;  (20979 61065))
;;; Generated autoloads from java.el

(autoload (quote srecode-semantic-handle-:java) "java" "\
Add macros into the dictionary DICT based on the current java file.
Adds the following:
FILENAME_AS_PACKAGE - file/dir converted into a java package name.
FILENAME_AS_CLASS - file converted to a Java class name.

\(fn DICT)" nil nil)

;;;***

;;;### (autoloads (srecode-m3-items) "m3" "m3.el" (20580 44401))
;;; Generated autoloads from m3.el

(autoload (quote srecode-m3-items) "m3" "\
Return a list of menu items based on SRecode features.

\(fn)" nil nil)

;;;***

;;;### (autoloads (srecode-get-maps) "map" "map.el" (20981 1996))
;;; Generated autoloads from map.el

(autoload (quote srecode-get-maps) "map" "\
Get a list of maps relevant to the current buffer.
Optional argument RESET forces a reset of the current map.

\(fn &optional RESET)" t nil)

;;;***

;;;### (autoloads (global-srecode-minor-mode srecode-minor-mode)
;;;;;;  "mode" "mode.el" (20779 52264))
;;; Generated autoloads from mode.el

(autoload (quote srecode-minor-mode) "mode" "\
Toggle srecode minor mode.
With prefix argument ARG, turn on if positive, otherwise off.  The
minor mode can be turned on only if semantic feature is available and
the current buffer was set up for parsing.  Return non-nil if the
minor mode is enabled.

\\{srecode-mode-map}

\(fn &optional ARG)" t nil)

(defvar global-srecode-minor-mode nil "\
Non-nil if Global-Srecode minor mode is enabled.
See the command `global-srecode-minor-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-srecode-minor-mode'.")

(custom-autoload (quote global-srecode-minor-mode) "mode" nil)

(autoload (quote global-srecode-minor-mode) "mode" "\
Toggle global use of srecode minor mode.
If ARG is positive or nil, enable, if it is negative, disable.

\(fn &optional ARG)" t nil)

(add-to-list (quote auto-mode-alist) (quote ("\\.srt$" . srecode-template-mode)))

;;;***

;;;### (autoloads (srecode-semantic-handle-:srt) "srt" "srt.el" (20724
;;;;;;  51953))
;;; Generated autoloads from srt.el

(autoload (quote srecode-semantic-handle-:srt) "srt" "\
Add macros into the dictionary DICT based on the current SRT file.
Adds the following:
ESCAPE_START - This files value of escape_start
ESCAPE_END - This files value of escape_end
MODE - The mode of this buffer.  If not declared yet, guess.

\(fn DICT)" nil nil)

;;;***

;;;### (autoloads (srecode-template-mode) "srt-mode" "srt-mode.el"
;;;;;;  (20779 52264))
;;; Generated autoloads from srt-mode.el

(autoload (quote srecode-template-mode) "srt-mode" "\
Major-mode for writing SRecode macros.

\(fn)" t nil)

(defalias (quote srt-mode) (quote srecode-template-mode))

;;;***

;;;### (autoloads (srecode-template-setup-parser) "template" "template.el"
;;;;;;  (20746 56154))
;;; Generated autoloads from template.el

(autoload (quote srecode-template-setup-parser) "template" "\
Setup buffer for parse.

\(fn)" nil nil)

;;;***

;;;### (autoloads (srecode-semantic-handle-:texitag srecode-semantic-handle-:texi)
;;;;;;  "texi" "texi.el" (20746 56154))
;;; Generated autoloads from texi.el

(autoload (quote srecode-semantic-handle-:texi) "texi" "\
Add macros into the dictionary DICT based on the current texinfo file.
Adds the following:
  LEVEL - chapter, section, subsection, etc
  NEXTLEVEL - One below level

\(fn DICT)" nil nil)

(autoload (quote srecode-semantic-handle-:texitag) "texi" "\
Add macros into the dictionary DICT based on the current :tag file.
Adds the following:
  TAGDOC - Texinfo formatted doc string for :tag.

\(fn DICT)" nil nil)

;;;***

;;;### (autoloads nil nil ("args.el" "ctxt.el" "dictionary.el" "extract.el"
;;;;;;  "fields.el" "filters.el" "find.el" "semantic.el" "table.el")
;;;;;;  (21169 32247 513853))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; loaddefs.el ends here

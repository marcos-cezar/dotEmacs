;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (semanticdb-debug-file-tag-check semantic-adebug-searchdb
;;;;;;  semantic-adebug-bovinate data-debug-insert-db-and-tag-button
;;;;;;  data-debug-insert-find-results-button data-debug-insert-find-results
;;;;;;  data-debug-insert-tag-list-button data-debug-insert-tag-list
;;;;;;  data-debug-insert-tag data-debug-insert-tag-parts-from-point)
;;;;;;  "adebug" "adebug.el" (20779 52264))
;;; Generated autoloads from adebug.el

(autoload (quote data-debug-insert-tag-parts-from-point) "adebug" "\
Call `data-debug-insert-tag-parts' based on text properties at POINT.

\(fn POINT)" nil nil)

(autoload (quote data-debug-insert-tag) "adebug" "\
Insert TAG into the current buffer at the current point.
PREFIX specifies text to insert in front of TAG.
PREBUTTONTEXT is text appearing btewen the prefix and TAG.
Optional PARENT is the parent tag containing TAG.
Add text properties needed to allow tag expansion later.

\(fn TAG PREFIX PREBUTTONTEXT &optional PARENT)" nil nil)

(autoload (quote data-debug-insert-tag-list) "adebug" "\
Insert the tag list TAGLIST with PREFIX.
Optional argument PARENT specifies the part of TAGLIST.

\(fn TAGLIST PREFIX &optional PARENT)" nil nil)

(autoload (quote data-debug-insert-tag-list-button) "adebug" "\
Insert a single summary of a TAGLIST.
PREFIX is the text that preceeds the button.
PREBUTTONTEXT is some text between PREFIX and the taglist button.
PARENT is the tag that represents the parent of all the tags.

\(fn TAGLIST PREFIX PREBUTTONTEXT &optional PARENT)" nil nil)

(autoload (quote data-debug-insert-find-results) "adebug" "\
Insert the find results FINDRES with PREFIX.

\(fn FINDRES PREFIX)" nil nil)

(autoload (quote data-debug-insert-find-results-button) "adebug" "\
Insert a single summary of a find results FINDRES.
PREFIX is the text that preceeds the button.
PREBUTTONTEXT is some text between prefix and the find results button.

\(fn FINDRES PREFIX PREBUTTONTEXT)" nil nil)

(autoload (quote data-debug-insert-db-and-tag-button) "adebug" "\
Insert a single summary of short list DBTAG of format (DB . TAG).
PREFIX is the text that preceeds the button.
PREBUTTONTEXT is some text between prefix and the find results button.

\(fn DBTAG PREFIX PREBUTTONTEXT)" nil nil)

(autoload (quote semantic-adebug-bovinate) "adebug" "\
The same as `bovinate'.  Display the results in a debug buffer.

\(fn)" t nil)

(autoload (quote semantic-adebug-searchdb) "adebug" "\
Search the semanticdb for REGEX for the current buffer.
Display the results as a debug list.

\(fn REGEX)" t nil)

(autoload (quote semanticdb-debug-file-tag-check) "adebug" "\
Report debug info for checking STARTFILE for up-to-date tags.

\(fn STARTFILE)" t nil)

;;;***

;;;### (autoloads nil "analyze" "analyze.el" (20988 3394))
;;; Generated autoloads from analyze.el

(define-overloadable-function semantic-analyze-current-context (&optional position) "\
Analyze the current context at optional POSITION.
If called interactively, display interesting information about POSITION
in a separate buffer.
Returns an object based on symbol `semantic-analyze-context'.

This function can be overridden with the symbol `analyze-context'.
When overriding this function, your override will be called while
cursor is at POSITION.  In addition, your function will not be called
if a cached copy of the return object is found." (interactive "d") (when (not (semantic-active-p)) (error "Cannot analyze buffers not supported by Semantic")) (semantic-refresh-tags-safe) (if (not position) (setq position (point))) (save-excursion (goto-char position) (let* ((answer (semantic-get-cache-data (quote current-context)))) (with-syntax-table semantic-lex-syntax-table (when (not answer) (setq answer (:override)) (when (and answer (oref answer bounds)) (with-slots (bounds) answer (semantic-cache-data-to-buffer (current-buffer) (car bounds) (cdr bounds) answer (quote current-context) (quote exit-cache-zone)))) (when (called-interactively-p (quote any)) (if answer (semantic-analyze-pop-to-context answer) (message "No Context.")))) answer))))

;;;***

;;;### (autoloads (bison->wisent) "bison-wisent" "wisent/bison-wisent.el"
;;;;;;  (20580 44388))
;;; Generated autoloads from wisent/bison-wisent.el

(autoload (quote bison->wisent) "bison-wisent" "\
Treat the current buffer as a YACC or BISON file, and translate to wisent.
Replaces all comments with wisent compatible comments.
Finds % commands that wisent cannot handle, and comments them out.
Deletes all actions, replacing them with small comments.

\(fn)" t nil)

;;;***

;;;### (autoloads (semantic-bovinate-stream) "bovine" "bovine.el"
;;;;;;  (20746 56154))
;;; Generated autoloads from bovine.el

(autoload (quote semantic-bovinate-stream) "bovine" "\
Bovinate STREAM, starting at the first NONTERMINAL rule.
Use `bovine-toplevel' if NONTERMINAL is not provided.
This is the core routine for converting a stream into a table.
Return the list (STREAM SEMANTIC-STREAM) where STREAM are those
elements of STREAM that have not been used.  SEMANTIC-STREAM is the
list of semantic tokens found.

\(fn STREAM &optional NONTERMINAL)" nil nil)

(defalias (quote semantic-parse-stream-default) (quote semantic-bovinate-stream))

;;;***

;;;### (autoloads (semantic-c-add-preprocessor-symbol semantic-default-c-setup)
;;;;;;  "c" "bovine/c.el" (21130 37297))
;;; Generated autoloads from bovine/c.el

(autoload (quote semantic-default-c-setup) "c" "\
Set up a buffer for semantic parsing of the C language.

\(fn)" nil nil)

(autoload (quote semantic-c-add-preprocessor-symbol) "c" "\
Add a preprocessor symbol SYM with a REPLACEMENT value.

\(fn SYM REPLACEMENT)" t nil)

;;;***

;;;### (autoloads (wisent-calc-utest wisent-calc) "calc" "wisent/calc.el"
;;;;;;  (20981 1996))
;;; Generated autoloads from wisent/calc.el

(autoload (quote wisent-calc) "calc" "\
Infix desktop calculator.
Parse INPUT string and output the result of computation.

\(fn INPUT)" t nil)

(autoload (quote wisent-calc-utest) "calc" "\
Test the wisent calculator.

\(fn)" t nil)

;;;***

;;;### (autoloads (semantic-clang-activate) "clang" "bovine/clang.el"
;;;;;;  (21072 25015))
;;; Generated autoloads from bovine/clang.el

(autoload (quote semantic-clang-activate) "clang" "\
Activate clang completions for C/C++.

\(fn)" t nil)

;;;***

;;;### (autoloads (semantic-complete-inline-project semantic-complete-self-insert
;;;;;;  semantic-complete-analyze-inline-idle semantic-complete-analyze-inline
;;;;;;  semantic-complete-analyze-and-replace semantic-complete-jump-local-members
;;;;;;  semantic-complete-jump semantic-complete-jump-local semantic-displayor-tooltip-initial-max-tags
;;;;;;  semantic-displayor-tooltip-mode) "complete" "complete.el"
;;;;;;  (21163 33795))
;;; Generated autoloads from complete.el

(defvar semantic-displayor-tooltip-mode (quote standard) "\
Mode for the tooltip inline completion.

Standard: Show only `semantic-displayor-tooltip-initial-max-tags'
number of completions initially.  Pressing TAB will show the
extended set.

Quiet: Only show completions when we have narrowed all
possibilities down to a maximum of
`semantic-displayor-tooltip-initial-max-tags' tags.  Pressing TAB
multiple times will also show completions.

Verbose: Always show all completions available.

The absolute maximum number of completions for all mode is
determined through `semantic-displayor-tooltip-max-tags'.")

(custom-autoload (quote semantic-displayor-tooltip-mode) "complete" t)

(defvar semantic-displayor-tooltip-initial-max-tags 5 "\
Maximum number of tags to be displayed initially.
See doc-string of `semantic-displayor-tooltip-mode' for details.")

(custom-autoload (quote semantic-displayor-tooltip-initial-max-tags) "complete" t)

(autoload (quote semantic-complete-jump-local) "complete" "\
Jump to a local semantic symbol.

\(fn)" t nil)

(autoload (quote semantic-complete-jump) "complete" "\
Jump to a semantic symbol.

\(fn)" t nil)

(autoload (quote semantic-complete-jump-local-members) "complete" "\
Jump to a semantic symbol.

\(fn)" t nil)

(autoload (quote semantic-complete-analyze-and-replace) "complete" "\
Perform prompt completion to do in buffer completion.
`semantic-analyze-possible-completions' is used to determine the
possible values.
The minibuffer is used to perform the completion.
The result is inserted as a replacement of the text that was there.

\(fn)" t nil)

(autoload (quote semantic-complete-analyze-inline) "complete" "\
Perform prompt completion to do in buffer completion.
`semantic-analyze-possible-completions' is used to determine the
possible values.
The function returns immediately, leaving the buffer in a mode that
will perform the completion.
Configure `semantic-complete-inline-analyzer-displayor-class' to change
how completion options are displayed.

\(fn)" t nil)

(autoload (quote semantic-complete-analyze-inline-idle) "complete" "\
Perform prompt completion to do in buffer completion.
`semantic-analyze-possible-completions' is used to determine the
possible values.
The function returns immediately, leaving the buffer in a mode that
will perform the completion.
Configure `semantic-complete-inline-analyzer-idle-displayor-class'
to change how completion options are displayed.

\(fn)" t nil)

(autoload (quote semantic-complete-self-insert) "complete" "\
Like `self-insert-command', but does completion afterwards.
ARG is passed to `self-insert-command'.  If ARG is nil,
use `semantic-complete-analyze-inline' to complete.

\(fn ARG)" t nil)

(autoload (quote semantic-complete-inline-project) "complete" "\
Perform inline completion for any symbol in the current project.
`semantic-analyze-possible-completions' is used to determine the
possible values.
The function returns immediately, leaving the buffer in a mode that
will perform the completion.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "cscope" "symref/cscope.el" (20746 56154))
;;; Generated autoloads from symref/cscope.el

(defclass semantic-symref-tool-cscope (semantic-symref-tool-baseclass) nil "A symref tool implementation using CScope.\nThe CScope command can be used to generate lists of tags in a way\nsimilar to that of `grep'.  This tool will parse the output to generate\nthe hit list.\n\nSee the function `cedet-cscope-search' for more details.")

;;;***

;;;### (autoloads nil "ctxt" "ctxt.el" (20991 62651))
;;; Generated autoloads from ctxt.el

(define-overloadable-function semantic-ctxt-current-mode (&optional point) "\
Return the major mode active at POINT.
POINT defaults to the value of point in current buffer.
You should override this function in multiple mode buffers to
determine which major mode apply at point.")

;;;***

;;;### (autoloads (semantic-tag-customize semantic-tag-widget-to-external
;;;;;;  semantic-tag-widget-to-internal semantic-tag-widget-value-get
;;;;;;  semantic-tag-widget-value-create semantic-tag-widget-match)
;;;;;;  "custom" "custom.el" (20580 44388))
;;; Generated autoloads from custom.el

(define-widget (quote tag-edit) (quote group) "\
Abstractly modify a Semantic Tag." :tag "Tag" :format "%v" :convert-widget (quote widget-types-convert-widget) :value-create (quote semantic-tag-widget-value-create) :value-get (quote semantic-tag-widget-value-get) :value-delete (quote widget-children-value-delete) :validate (quote widget-children-validate) :match (quote semantic-tag-widget-match) :clone-object-children nil)

(autoload (quote semantic-tag-widget-match) "custom" "\
Match infor for WIDGET against VALUE.

\(fn WIDGET VALUE)" nil nil)

(autoload (quote semantic-tag-widget-value-create) "custom" "\
Create the value of WIDGET.

\(fn WIDGET)" nil nil)

(autoload (quote semantic-tag-widget-value-get) "custom" "\
Get the value out of WIDGET.

\(fn WIDGET)" nil nil)

(define-widget (quote tag) (quote tag-edit) "\
A Semantic Tag." :format "%{%t%}:
%v" :value-to-internal (quote semantic-tag-widget-to-internal) :value-to-external (quote semantic-tag-widget-to-external) :close-object-children t)

(autoload (quote semantic-tag-widget-to-internal) "custom" "\
For WIDGET, convert VALUE to a safe representation.

\(fn WIDGET VALUE)" nil nil)

(autoload (quote semantic-tag-widget-to-external) "custom" "\
For WIDGET, convert VALUE from the abstract value.

\(fn WIDGET VALUE)" nil nil)

(autoload (quote semantic-tag-customize) "custom" "\
Customize TAG.
When the user clicks 'ACCEPT', then the location where TAG
is stored is directly modified.
If TAG is not provided, then the tag under point is used.

\(fn &optional TAG)" t nil)

;;;***

;;;### (autoloads (semanticdb-file-table-object) "db" "db.el" (21134
;;;;;;  36589))
;;; Generated autoloads from db.el

(defvar semanticdb-current-database nil "\
For a given buffer, this is the currently active database.")

(defvar semanticdb-current-table nil "\
For a given buffer, this is the currently active database table.")

(autoload (quote semanticdb-file-table-object) "db" "\
Return a semanticdb table belonging to FILE, make it up to date.
If file has database tags available in the database, return it.
If file does not have tags available, and DONTLOAD is nil,
then load the tags for FILE, and create a new table object for it.
DONTLOAD does not affect the creation of new database objects.

\(fn FILE &optional DONTLOAD)" nil nil)

;;;***

;;;### (autoloads (semanticdb-enable-cscope-databases) "db-cscope"
;;;;;;  "db-cscope.el" (20580 44388))
;;; Generated autoloads from db-cscope.el

(autoload (quote semanticdb-enable-cscope-databases) "db-cscope" "\
Enable the use of the CScope back end for all files in C/C++.
This will add an instance of a CScope database to each buffer in a
CScope supported hierarchy.

Two sanity checks are performed to assure (a) that cscope program exists
and (b) that the cscope program version is compatibility with the database
version.  If optional NOERROR is nil, then an error may be signalled on version
mismatch.  If NOERROR is not nil, then no error will be signlled.  Instead
return value will indicate success or failure with non-nil or nil respective
values.

\(fn &optional NOERROR)" nil nil)

;;;***

;;;### (autoloads nil "db-file" "db-file.el" (20779 52264))
;;; Generated autoloads from db-file.el

(defclass semanticdb-project-database-file (semanticdb-project-database eieio-persistent) ((file-header-line :initform ";; SEMANTICDB Tags save file") (do-backups :initform nil) (semantic-tag-version :initarg :semantic-tag-version :initform "1.4" :documentation "The version of the tags saved.\nThe default value is 1.4.  In semantic 1.4 there was no versioning, so\nwhen those files are loaded, this becomes the version number.\nTo save the version number, we must hand-set this version string.") (semanticdb-version :initarg :semanticdb-version :initform "1.4" :documentation "The version of the object system saved.\nThe default value is 1.4.  In semantic 1.4, there was no versioning,\nso when those files are loaded, this becomes the version number.\nTo save the version number, we must hand-set this version string.")) "Database of file tables saved to disk.")

;;;***

;;;### (autoloads (semanticdb-find-tags-by-class semanticdb-find-tags-for-completion
;;;;;;  semanticdb-find-tags-by-name-regexp semanticdb-find-tags-by-name
;;;;;;  semanticdb-find-result-nth-in-buffer semanticdb-find-result-nth
;;;;;;  semanticdb-find-result-length semanticdb-strip-find-results
;;;;;;  semanticdb-find-adebug-lost-includes semanticdb-find-test-translate-path
;;;;;;  semanticdb-find-default-throttle) "db-find" "db-find.el"
;;;;;;  (20908 48525))
;;; Generated autoloads from db-find.el

(defvar semanticdb-find-default-throttle (quote (local project unloaded system recursive)) "\
The default throttle for `semanticdb-find' routines.
The throttle controls how detailed the list of database
tables is for a symbol lookup.  The value is a list with
the following keys:
  `file'       - The file the search is being performed from.
                 This option is here for completeness only, and
                 is assumed to always be on.
  `local'      - Tables from the same local directory are included.
                 This includes files directly referenced by a file name
                 which might be in a different directory.
  `project'    - Tables from the same local project are included
                 If `project' is specified, then `local' is assumed.
  `unloaded'   - If a table is not in memory, load it.  If it is not cached
                 on disk either, get the source, parse it, and create
                 the table.
  `system'     - Tables from system databases.  These are specifically
                 tables from system header files, or language equivalent.
  `recursive'  - For include based searches, includes tables referenced
                 by included files.
  `omniscience' - Included system databases which are omniscience, or
                 somehow know everything.  Omniscience databases are found
                 in `semanticdb-project-system-databases'.
                 The Emacs Lisp system DB is an omniscience database.")

(custom-autoload (quote semanticdb-find-default-throttle) "db-find" t)

(define-overloadable-function semanticdb-find-translate-path (path brutish) "\
Translate PATH into a list of semantic tables.
Path translation involves identifying the PATH input argument
in one of the following ways:
  nil - Take the current buffer, and use its include list
  buffer - Use that buffer's include list.
  filename - Use that file's include list.  If the file is not
      in a buffer, see of there is a semanticdb table for it.  If
      not, read that file into a buffer.
  tag - Get that tag's buffer of file file.  See above.
  table - Search that table, and its include list.
  find result - Search the results of a previous find.

In addition, once the base path is found, there is the possibility of
each added table adding yet more tables to the path, so this routine
can return a lengthy list.

If argument BRUTISH is non-nil, then instead of using the include
list, use all tables found in the parent project of the table
identified by translating PATH.  Such searches use brute force to
scan every available table.

The return value is a list of objects of type `semanticdb-table' or
their children.  In the case of passing in a find result, the result
is returned unchanged.

This routine uses `semanticdb-find-table-for-include' to translate
specific include tags into a semanticdb table.

Note: When searching using a non-brutish method, the list of
included files will be cached between runs.  Database-references
are used to track which files need to have their include lists
refreshed when things change.  See `semanticdb-ref-test'.

Note for overloading:  If you opt to overload this function for your
major mode, and your routine takes a long time, be sure to call

 (semantic-throw-on-input 'your-symbol-here)

so that it can be called from the idle work handler.")

(define-overloadable-function semanticdb-find-table-for-include (includetag &optional table) "\
For a single INCLUDETAG found in TABLE, find a `semanticdb-table' object
INCLUDETAG is a semantic TAG of class 'include.
TABLE is a semanticdb table that identifies where INCLUDETAG came from.
TABLE is optional if INCLUDETAG has an overlay of :filename attribute.")

(autoload (quote semanticdb-find-test-translate-path) "db-find" "\
Call and output results of `semanticdb-find-translate-path'.
With ARG non-nil, specify a BRUTISH translation.
See `semanticdb-find-default-throttle' and `semanticdb-project-roots'
for details on how this list is derived.

\(fn &optional ARG)" t nil)

(autoload (quote semanticdb-find-adebug-lost-includes) "db-find" "\
Translate the current path, then display the lost includes.
Examines the variable `semanticdb-find-lost-includes'.

\(fn)" t nil)

(autoload (quote semanticdb-strip-find-results) "db-find" "\
Strip a semanticdb search RESULTS to exclude objects.
This makes it appear more like the results of a `semantic-find-' call.
Optional FIND-FILE-MATCH loads all files associated with RESULTS
into buffers.  This has the side effect of enabling `semantic-tag-buffer' to
return a value.
If FIND-FILE-MATCH is 'name, then only the filename is stored
in each tag instead of loading each file into a buffer.
If the input RESULTS are not going to be used again, and if
FIND-FILE-MATCH is nil, you can use `semanticdb-fast-strip-find-results'
instead.

\(fn RESULTS &optional FIND-FILE-MATCH)" nil nil)

(autoload (quote semanticdb-find-result-length) "db-find" "\
Number of tags found in RESULT.

\(fn RESULT)" nil nil)

(autoload (quote semanticdb-find-result-nth) "db-find" "\
In RESULT, return the Nth search result.
This is a 0 based search result, with the first match being element 0.

The returned value is a cons cell: (TAG . TABLE) where TAG
is the tag at the Nth position.  TABLE is the semanticdb table where
the TAG was found.  Sometimes TABLE can be nil.

\(fn RESULT N)" nil nil)

(autoload (quote semanticdb-find-result-nth-in-buffer) "db-find" "\
In RESULT, return the Nth search result.
Like `semanticdb-find-result-nth', except that only the TAG
is returned, and the buffer it is found it will be made current.
If the result tag has no position information, the originating buffer
is still made current.

\(fn RESULT N)" nil nil)

(autoload (quote semanticdb-find-tags-by-name) "db-find" "\
Search for all tags matching NAME on PATH.
See `semanticdb-find-translate-path' for details on PATH.
FIND-FILE-MATCH indicates that any time a match is found, the file
associated with that tag should be loaded into a buffer.

\(fn NAME &optional PATH FIND-FILE-MATCH)" nil nil)

(autoload (quote semanticdb-find-tags-by-name-regexp) "db-find" "\
Search for all tags matching REGEXP on PATH.
See `semanticdb-find-translate-path' for details on PATH.
FIND-FILE-MATCH indicates that any time a match is found, the file
associated with that tag should be loaded into a buffer.

\(fn REGEXP &optional PATH FIND-FILE-MATCH)" nil nil)

(autoload (quote semanticdb-find-tags-for-completion) "db-find" "\
Search for all tags matching PREFIX on PATH.
See `semanticdb-find-translate-path' for details on PATH.
FIND-FILE-MATCH indicates that any time a match is found, the file
associated with that tag should be loaded into a buffer.

\(fn PREFIX &optional PATH FIND-FILE-MATCH)" nil nil)

(autoload (quote semanticdb-find-tags-by-class) "db-find" "\
Search for all tags of CLASS on PATH.
See `semanticdb-find-translate-path' for details on PATH.
FIND-FILE-MATCH indicates that any time a match is found, the file
associated with that tag should be loaded into a buffer.

\(fn CLASS &optional PATH FIND-FILE-MATCH)" nil nil)

;;;***

;;;### (autoloads (semanticdb-enable-gnu-global-databases) "db-global"
;;;;;;  "db-global.el" (21163 33795))
;;; Generated autoloads from db-global.el

(autoload (quote semanticdb-enable-gnu-global-databases) "db-global" "\
Enable the use of the GNU Global SemanticDB back end for all files of MODE.
This will add an instance of a GNU Global database to each buffer
in a GNU Global supported hierarchy.

Two sanity checks are performed to assure (a) that GNU global program exists
and (b) that the GNU global program version is compatibility with the database
version.  If optional NOERROR is nil, then an error may be signalled on version
mismatch.  If NOERROR is not nil, then no error will be signaled.  Instead
return value will indicate success or failure with non-nil or nil respective
values.

\(fn MODE &optional NOERROR)" t nil)

;;;***

;;;### (autoloads (semanticdb-javap-get-java-lang-classes) "db-javap"
;;;;;;  "db-javap.el" (21076 65273))
;;; Generated autoloads from db-javap.el

(autoload (quote semanticdb-javap-get-java-lang-classes) "db-javap" "\
Returns list of classes defined in java.lang package (in format for direct injection
into the tags)

\(fn)" nil nil)

;;;***

;;;### (autoloads (global-semanticdb-minor-mode semanticdb-minor-mode-p)
;;;;;;  "db-mode" "db-mode.el" (21134 29786))
;;; Generated autoloads from db-mode.el

(autoload (quote semanticdb-minor-mode-p) "db-mode" "\
Return non-nil if `semanticdb-minor-mode' is active.

\(fn)" nil nil)

(defvar global-semanticdb-minor-mode nil "\
Non-nil if Global-Semanticdb minor mode is enabled.
See the command `global-semanticdb-minor-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-semanticdb-minor-mode'.")

(custom-autoload (quote global-semanticdb-minor-mode) "db-mode" nil)

(autoload (quote global-semanticdb-minor-mode) "db-mode" "\
Toggle Semantic DB mode.
With ARG, turn Semantic DB mode on if ARG is positive, off otherwise.

In Semantic DB mode, Semantic parsers store results in a
database, which can be saved for future Emacs sessions.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (semanticdb-mozrepl-activate) "db-mozrepl" "db-mozrepl.el"
;;;;;;  (20580 44388))
;;; Generated autoloads from db-mozrepl.el

(autoload (quote semanticdb-mozrepl-activate) "db-mozrepl" "\
Activate mozrepl database for Javascript.
Connect to `semanticdb-mozrepl-host' on port
`semanticdb-mozrepl-port'.  If `semanticdb-mozrepl-URL' is
defined it will automatically open that location, otherwise it
will ask the user.

\(fn)" t nil)

;;;***

;;;### (autoloads (semanticdb-find-nonterminal-by-function semanticdb-find-nonterminal-by-extra-spec-value
;;;;;;  semanticdb-find-nonterminal-by-extra-spec semanticdb-find-nonterminal-by-property
;;;;;;  semanticdb-find-nonterminal-by-type semanticdb-find-nonterminal-by-name-regexp
;;;;;;  semanticdb-find-nonterminal-by-name semanticdb-find-nonterminal-by-token)
;;;;;;  "db-search" "db-search.el" (20580 44388))
;;; Generated autoloads from db-search.el

(autoload (quote semanticdb-find-nonterminal-by-token) "db-search" "\
OBSOLETE:
Find all occurances of nonterminals with token TOKEN in databases.
See `semanticdb-find-nonterminal-by-function' for details on DATABASES,
SEARCH-PARTS, SEARCH-INCLUDES, DIFF-MODE, FIND-FILE-MATCH and IGNORE-SYSTEM.
Return a list ((DB-TABLE . TOKEN-LIST) ...).

\(fn TOKEN &optional DATABASES SEARCH-PARTS SEARCH-INCLUDES DIFF-MODE FIND-FILE-MATCH IGNORE-SYSTEM)" nil nil)

(autoload (quote semanticdb-find-nonterminal-by-name) "db-search" "\
OBSOLETE:
Find all occurances of nonterminals with name NAME in databases.
See `semanticdb-find-nonterminal-by-function' for details on DATABASES,
SEARCH-PARTS, SEARCH-INCLUDES, DIFF-MODE, FIND-FILE-MATCH and IGNORE-SYSTEM.
Return a list ((DB-TABLE . TOKEN) ...).

\(fn NAME &optional DATABASES SEARCH-PARTS SEARCH-INCLUDES DIFF-MODE FIND-FILE-MATCH IGNORE-SYSTEM)" nil nil)

(autoload (quote semanticdb-find-nonterminal-by-name-regexp) "db-search" "\
OBSOLETE:
Find all occurances of nonterminals with name matching REGEX in databases.
See `semanticdb-find-nonterminal-by-function' for details on DATABASES,
SEARCH-PARTS, SEARCH-INCLUDES DIFF-MODE, FIND-FILE-MATCH and IGNORE-SYSTEM.
Return a list ((DB-TABLE . TOKEN-LIST) ...).

\(fn REGEX &optional DATABASES SEARCH-PARTS SEARCH-INCLUDES DIFF-MODE FIND-FILE-MATCH IGNORE-SYSTEM)" nil nil)

(autoload (quote semanticdb-find-nonterminal-by-type) "db-search" "\
OBSOLETE:
Find all nonterminals with a type of TYPE in databases.
See `semanticdb-find-nonterminal-by-function' for details on DATABASES,
SEARCH-PARTS, SEARCH-INCLUDES DIFF-MODE, FIND-FILE-MATCH and IGNORE-SYSTEM.
Return a list ((DB-TABLE . TOKEN-LIST) ...).

\(fn TYPE &optional DATABASES SEARCH-PARTS SEARCH-INCLUDES DIFF-MODE FIND-FILE-MATCH IGNORE-SYSTEM)" nil nil)

(autoload (quote semanticdb-find-nonterminal-by-property) "db-search" "\
OBSOLETE:
Find all nonterminals with a PROPERTY equal to VALUE in databases.
See `semanticdb-find-nonterminal-by-function' for details on DATABASES,
SEARCH-PARTS, SEARCH-INCLUDES DIFF-MODE, FIND-FILE-MATCH and IGNORE-SYSTEM.
Return a list ((DB-TABLE . TOKEN-LIST) ...).

\(fn PROPERTY VALUE &optional DATABASES SEARCH-PARTS SEARCH-INCLUDES DIFF-MODE FIND-FILE-MATCH IGNORE-SYSTEM)" nil nil)

(autoload (quote semanticdb-find-nonterminal-by-extra-spec) "db-search" "\
OBSOLETE:
Find all nonterminals with a SPEC in databases.
See `semanticdb-find-nonterminal-by-function' for details on DATABASES,
SEARCH-PARTS, SEARCH-INCLUDES DIFF-MODE, FIND-FILE-MATCH and IGNORE-SYSTEM.
Return a list ((DB-TABLE . TOKEN-LIST) ...).

\(fn SPEC &optional DATABASES SEARCH-PARTS SEARCH-INCLUDES DIFF-MODE FIND-FILE-MATCH IGNORE-SYSTEM)" nil nil)

(autoload (quote semanticdb-find-nonterminal-by-extra-spec-value) "db-search" "\
OBSOLETE:
Find all nonterminals with a SPEC equal to VALUE in databases.
See `semanticdb-find-nonterminal-by-function' for details on DATABASES,
SEARCH-PARTS, SEARCH-INCLUDES DIFF-MODE, FIND-FILE-MATCH and IGNORE-SYSTEM.
Return a list ((DB-TABLE . TOKEN-LIST) ...).

\(fn SPEC VALUE &optional DATABASES SEARCH-PARTS SEARCH-INCLUDES DIFF-MODE FIND-FILE-MATCH IGNORE-SYSTEM)" nil nil)

(autoload (quote semanticdb-find-nonterminal-by-function) "db-search" "\
OBSOLETE:
Find all occurances of nonterminals which match FUNCTION.
Search in all DATABASES.  If DATABASES is nil, search a range of
associated databases calculated `semanticdb-current-database-list' and
DATABASES is a list of variable `semanticdb-project-database' objects.
When SEARCH-PARTS is non-nil the search will include children of tags.
When SEARCH-INCLUDES is non-nil, the search will include dependency files.
When DIFF-MODE is non-nil, search databases which are of a different mode.
A Mode is the `major-mode' that file was in when it was last parsed.
When FIND-FILE-MATCH is non-nil, the make sure any found token's file is
in an Emacs buffer.
When IGNORE-SYSTEM is non-nil, system libraries are not searched.
Return a list ((DB-TABLE . TOKEN-OR-TOKEN-LIST) ...).

\(fn FUNCTION &optional DATABASES SEARCH-PARTS SEARCH-INCLUDES DIFF-MODE FIND-FILE-MATCH IGNORE-SYSTEM)" nil nil)

;;;***

;;;### (autoloads nil "db-typecache" "db-typecache.el" (20746 56154))
;;; Generated autoloads from db-typecache.el

(defclass semanticdb-typecache nil ((filestream :initform nil :documentation "Fully sorted/merged list of tags within this buffer.") (includestream :initform nil :documentation "Fully sorted/merged list of tags from this file's includes list.") (stream :initform nil :documentation "The searchable tag stream for this cache.\nNOTE: Can I get rid of this?  Use a hashtable instead?") (dependants :initform nil :documentation "Any other object that is dependent on typecache results.\nSaid object must support `semantic-reset' methods.")) "Structure for maintaining a typecache.")

(defclass semanticdb-database-typecache (semanticdb-abstract-db-cache) ((stream :initform nil :documentation "The searchable tag stream for this cache.")) "Structure for maintaining a typecache.")

(define-overloadable-function semanticdb-typecache-find (type &optional path find-file-match) "\
Search the typecache for TYPE in PATH.
If type is a string, split the string, and search for the parts.
If type is a list, treat the type as a pre-split string.
PATH can be nil for the current buffer, or a semanticdb table.
FIND-FILE-MATCH is non-nil to force all found tags to be loaded into a buffer.")

;;;***

;;;### (autoloads nil "debug" "debug.el" (20746 56154))
;;; Generated autoloads from debug.el

(defvar semantic-debug-parser-source nil "\
For any buffer, the file name (no path) of the parser.
This would be a parser for a specific language, not the source
to one of the parser generators.")

(make-variable-buffer-local (quote semantic-debug-parser-source))

(defvar semantic-debug-parser-class nil "\
Class to create when building a debug parser object.")

(make-variable-buffer-local (quote semantic-debug-parser-class))

;;;***

;;;### (autoloads (semantic-customize-system-include-path semantic-reset-system-include
;;;;;;  semantic-remove-system-include semantic-add-system-include)
;;;;;;  "dep" "dep.el" (20746 56154))
;;; Generated autoloads from dep.el

(autoload (quote semantic-add-system-include) "dep" "\
Add a system include DIR to path for MODE.
Modifies a mode-local version of `semantic-dependency-system-include-path'.

Changes made by this function are not persistent.

\(fn DIR &optional MODE)" t nil)

(autoload (quote semantic-remove-system-include) "dep" "\
Add a system include DIR to path for MODE.
Modifies a mode-local version of`semantic-dependency-system-include-path'.

Changes made by this function are not persistent.

\(fn DIR &optional MODE)" t nil)

(autoload (quote semantic-reset-system-include) "dep" "\
Reset the system include list to empty for MODE.
Modifies a mode-local version of
`semantic-dependency-system-include-path'.

\(fn &optional MODE)" t nil)

(autoload (quote semantic-customize-system-include-path) "dep" "\
Customize the include path for this `major-mode'.
To create a customizable include path for a major MODE, use the
macro `defcustom-mode-local-semantic-dependency-system-include-path'.

\(fn &optional MODE)" t nil)

;;;***

;;;### (autoloads nil "doc" "doc.el" (20746 56154))
;;; Generated autoloads from doc.el

(define-overloadable-function semantic-documentation-for-tag (&optional tag nosnarf) "\
Find documentation from TAG and return it as a clean string.
TAG might have DOCUMENTATION set in it already.  If not, there may be
some documentation in a comment preceding TAG's definition which we
can look for.  When appropriate, this can be overridden by a language specific
enhancement.
Optional argument NOSNARF means to only return the lexical analyzer token for it.
If nosnarf if 'lex, then only return the lex token." (if (not tag) (setq tag (semantic-current-tag))) (save-excursion (when (semantic-tag-with-position-p tag) (set-buffer (semantic-tag-buffer tag))) (:override (save-excursion (semantic-go-to-tag tag) (let ((doctmp (semantic-tag-docstring tag (current-buffer)))) (or doctmp (when (semantic-tag-with-position-p tag) (semantic-documentation-comment-preceeding-tag tag nosnarf)) nil))))))

;;;***

;;;### (autoloads (semantic-edits-incremental-parser semantic-change-function)
;;;;;;  "edit" "edit.el" (20976 32674))
;;; Generated autoloads from edit.el

(autoload (quote semantic-change-function) "edit" "\
Provide a mechanism for semantic tag management.
Argument START, END, and LENGTH specify the bounds of the change.

\(fn START END LENGTH)" nil nil)

(autoload (quote semantic-edits-incremental-parser) "edit" "\
Incrementally reparse the current buffer.
Incremental parser allows semantic to only reparse those sections of
the buffer that have changed.  This function depends on
`semantic-edits-change-function-handle-changes' setting up change
overlays in the current buffer.  Those overlays are analyzed against
the semantic cache to see what needs to be changed.

\(fn)" nil nil)

(defalias (quote semantic-parse-changes-default) (quote semantic-edits-incremental-parser))

;;;***

;;;### (autoloads (semantic-default-elisp-setup) "el" "bovine/el.el"
;;;;;;  (20979 61065))
;;; Generated autoloads from bovine/el.el

(autoload (quote semantic-default-elisp-setup) "el" "\
Setup hook function for Emacs Lisp files and Semantic.

\(fn)" nil nil)

;;;***

;;;### (autoloads (semantic-elp-load-old-run semantic-elp-analyze)
;;;;;;  "elp" "elp.el" (20779 52264))
;;; Generated autoloads from elp.el

(autoload (quote semantic-elp-analyze) "elp" "\
Run the analyzer, using ELP to measure performance.

\(fn)" t nil)

(autoload (quote semantic-elp-load-old-run) "elp" "\
Load an old run from FILE, and show it.

\(fn FILE)" t nil)

;;;***

;;;### (autoloads (semantic-default-f90-setup) "f90" "bovine/f90.el"
;;;;;;  (20810 7850))
;;; Generated autoloads from bovine/f90.el

(autoload (quote semantic-default-f90-setup) "f90" "\
Set up a buffer for semantic parsing of the F90 language.

\(fn)" nil nil)

;;;***

;;;### (autoloads (semantic-find-first-tag-by-name semantic-current-tag-parent
;;;;;;  semantic-current-tag semantic-find-tag-parent-by-overlay
;;;;;;  semantic-find-tag-by-overlay-prev semantic-find-tag-by-overlay-next
;;;;;;  semantic-find-tag-by-overlay-in-region semantic-find-tag-by-overlay)
;;;;;;  "find" "find.el" (20786 48311))
;;; Generated autoloads from find.el

(autoload (quote semantic-find-tag-by-overlay) "find" "\
Find all tags covering POSITIONORMARKER by using overlays.
If POSITIONORMARKER is nil, use the current point.
Optional BUFFER is used if POSITIONORMARKER is a number, otherwise the current
buffer is used.  This finds all tags covering the specified position
by checking for all overlays covering the current spot.  They are then sorted
from largest to smallest via the start location.

\(fn &optional POSITIONORMARKER BUFFER)" nil nil)

(autoload (quote semantic-find-tag-by-overlay-in-region) "find" "\
Find all tags which exist in whole or in part between START and END.
Uses overlays to determine position.
Optional BUFFER argument specifies the buffer to use.

\(fn START END &optional BUFFER)" nil nil)

(autoload (quote semantic-find-tag-by-overlay-next) "find" "\
Find the next tag after START in BUFFER.
If START is in an overlay, find the tag which starts next,
not the current tag.

\(fn &optional START BUFFER)" nil nil)

(autoload (quote semantic-find-tag-by-overlay-prev) "find" "\
Find the next tag before START in BUFFER.
If START is in an overlay, find the tag which starts next,
not the current tag.

\(fn &optional START BUFFER)" nil nil)

(autoload (quote semantic-find-tag-parent-by-overlay) "find" "\
Find the parent of TAG by overlays.
Overlays are a fast way of finding this information for active buffers.

\(fn TAG)" nil nil)

(autoload (quote semantic-current-tag) "find" "\
Return the current tag in the current buffer.
If there are more than one in the same location, return the
smallest tag.  Return nil if there is no tag here.

\(fn)" nil nil)

(autoload (quote semantic-current-tag-parent) "find" "\
Return the current tags parent in the current buffer.
A tag's parent would be a containing structure, such as a type
containing a field.  Return nil if there is no parent.

\(fn)" nil nil)

(autoload (quote semantic-find-first-tag-by-name) "find" "\
Find the first tag with NAME in TABLE.
NAME is a string.
TABLE is a semantic tags table.  See `semantic-something-to-tag-table'.
This routine uses `assoc' to quickly find the first matching entry.

\(fn NAME &optional TABLE)" nil nil)

(define-overloadable-function semantic-find-tags-by-scope-protection (scopeprotection parent &optional table) "\
Find all tags accessible by SCOPEPROTECTION.
SCOPEPROTECTION is a symbol which can be returned by the method
`semantic-tag-protection'.  A hard-coded order is used to determine a match.
PARENT is a tag representing the PARENT slot needed for
`semantic-tag-protection'.
TABLE is a list of tags (a subset of PARENT members) to scan.  If TABLE is nil,
the type members of PARENT are used.
See `semantic-tag-protected-p' for details on which tags are returned." (if (not (eq (semantic-tag-class parent) (quote type))) (signal (quote wrong-type-argument) (quote (semantic-find-tags-by-scope-protection parent semantic-tag-class type))) (:override)))

(define-overloadable-function semantic-find-tags-included (&optional table) "\
Find all tags in TABLE that are of the 'include class.
TABLE is a tag table.  See `semantic-something-to-tag-table'.")

;;;***

;;;### (autoloads nil "format" "format.el" (21134 27986))
;;; Generated autoloads from format.el

(define-overloadable-function semantic-format-tag-name (tag &optional parent color) "\
Return the name string describing TAG.
The name is the shortest possible representation.
Optional argument PARENT is the parent type if TAG is a detail.
Optional argument COLOR means highlight the prototype with font-lock colors.")

(define-overloadable-function semantic-format-tag-summarize (tag &optional parent color) "\
Summarize TAG in a reasonable way.
Optional argument PARENT is the parent type if TAG is a detail.
Optional argument COLOR means highlight the prototype with font-lock colors.")

(define-overloadable-function semantic-format-tag-prototype (tag &optional parent color) "\
Return a prototype for TAG.
This function should be overloaded, though it need not be used.
This is because it can be used to create code by language independent
tools.
Optional argument PARENT is the parent type if TAG is a detail.
Optional argument COLOR means highlight the prototype with font-lock colors.")

(define-overloadable-function semantic-format-tag-concise-prototype (tag &optional parent color) "\
Return a concise prototype for TAG.
Optional argument PARENT is the parent type if TAG is a detail.
Optional argument COLOR means highlight the prototype with font-lock colors.")

;;;***

;;;### (autoloads (semantic-gcc-setup) "gcc" "bovine/gcc.el" (21142
;;;;;;  24704))
;;; Generated autoloads from bovine/gcc.el

(autoload (quote semantic-gcc-setup) "gcc" "\
Setup Semantic C/C++ parsing based on GCC output.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "global" "symref/global.el" (20746 56154))
;;; Generated autoloads from symref/global.el

(defclass semantic-symref-tool-global (semantic-symref-tool-baseclass) nil "A symref tool implementation using GNU Global.\nThe GNU Global command can be used to generate lists of tags in a way\nsimilar to that of `grep'.  This tool will parse the output to generate\nthe hit list.\n\nSee the function `cedet-gnu-global-search' for more details.")

;;;***

;;;### (autoloads (bovine-grammar-mode) "grammar" "bovine/grammar.el"
;;;;;;  (20580 44388))
;;; Generated autoloads from bovine/grammar.el

(autoload (quote bovine-grammar-mode) "grammar" "\
Major mode for editing Bovine grammars.

\(fn)" t nil)

(add-to-list (quote auto-mode-alist) (quote ("\\.by$" . bovine-grammar-mode)))

(eval-after-load "speedbar" (quote (speedbar-add-supported-extension ".by")))

;;;***

;;;### (autoloads nil "grep" "symref/grep.el" (20746 56154))
;;; Generated autoloads from symref/grep.el

(defclass semantic-symref-tool-grep (semantic-symref-tool-baseclass) nil "A symref tool implementation using grep.\nThis tool uses EDE to find he root of the project, then executes\nfind-grep in the project.  The output is parsed for hits\nand those hits returned.")

;;;***

;;;### (autoloads (semantic-default-html-setup) "html" "html.el"
;;;;;;  (20746 56154))
;;; Generated autoloads from html.el

(autoload (quote semantic-default-html-setup) "html" "\
Set up a buffer for parsing of HTML files.

\(fn)" nil nil)

;;;***

;;;### (autoloads (semantic-ia-describe-class semantic-ia-show-doc
;;;;;;  semantic-ia-fast-mouse-jump semantic-ia-fast-jump semantic-ia-show-variants
;;;;;;  semantic-ia-show-summary semantic-ia-complete-tip semantic-ia-complete-symbol-menu
;;;;;;  semantic-ia-complete-symbol) "ia" "ia.el" (20746 56154))
;;; Generated autoloads from ia.el

(autoload (quote semantic-ia-complete-symbol) "ia" "\
Complete the current symbol at POS.
If POS is nil, default to point.
Completion options are calculated with `semantic-analyze-possible-completions'.

\(fn &optional POS)" t nil)

(autoload (quote semantic-ia-complete-symbol-menu) "ia" "\
Complete the current symbol via a menu based at POINT.
Completion options are calculated with `semantic-analyze-possible-completions'.

\(fn POINT)" t nil)

(autoload (quote semantic-ia-complete-tip) "ia" "\
Pop up a tooltip for completion at POINT.

\(fn POINT)" t nil)

(autoload (quote semantic-ia-show-summary) "ia" "\
Display a summary for the symbol under POINT.

\(fn POINT)" t nil)

(autoload (quote semantic-ia-show-variants) "ia" "\
Display a list of all variants for the symbol under POINT.

\(fn POINT)" t nil)

(autoload (quote semantic-ia-fast-jump) "ia" "\
Jump to the tag referred to by the code at POINT.
Uses `semantic-analyze-current-context' output to identify an accurate
origin of the code at point.

\(fn POINT)" t nil)

(autoload (quote semantic-ia-fast-mouse-jump) "ia" "\
Jump to the tag referred to by the point clicked on.
See `semantic-ia-fast-jump' for details on how it works.
 This command is meant to be bound to a mouse event.

\(fn EVT)" t nil)

(autoload (quote semantic-ia-show-doc) "ia" "\
Display the code-level documentation for the symbol at POINT.

\(fn POINT)" t nil)

(autoload (quote semantic-ia-describe-class) "ia" "\
Display all known parts for the datatype TYPENAME.
If the type in question is a class, all methods and other accessible
parts of the parent classes are displayed.

\(fn TYPENAME)" t nil)

;;;***

;;;### (autoloads (semantic-speedbar-analysis) "ia-sb" "ia-sb.el"
;;;;;;  (20746 56154))
;;; Generated autoloads from ia-sb.el

(autoload (quote semantic-speedbar-analysis) "ia-sb" "\
Start Speedbar in semantic analysis mode.
The analyzer displays information about the current context, plus a smart
list of possible completions.

\(fn)" t nil)

;;;***

;;;### (autoloads (global-semantic-idle-scheduler-mode semantic-idle-scheduler-mode)
;;;;;;  "idle" "idle.el" (20979 61065))
;;; Generated autoloads from idle.el

(autoload (quote semantic-idle-scheduler-mode) "idle" "\
Minor mode to auto parse buffer following a change.
When this mode is off, a buffer is only rescanned for tokens when
some command requests the list of available tokens.  When idle-scheduler
is enabled, Emacs periodically checks to see if the buffer is out of
date, and reparses while the user is idle (not typing.)

With prefix argument ARG, turn on if positive, otherwise off.  The
minor mode can be turned on only if semantic feature is available and
the current buffer was set up for parsing.  Return non-nil if the
minor mode is enabled.

\(fn &optional ARG)" t nil)

(defvar global-semantic-idle-scheduler-mode nil "\
Non-nil if Global-Semantic-Idle-Scheduler mode is enabled.
See the command `global-semantic-idle-scheduler-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-semantic-idle-scheduler-mode'.")

(custom-autoload (quote global-semantic-idle-scheduler-mode) "idle" nil)

(autoload (quote global-semantic-idle-scheduler-mode) "idle" "\
Toggle global use of option `semantic-idle-scheduler-mode'.
The idle scheduler will automatically reparse buffers in idle time,
and then schedule other jobs setup with `semantic-idle-scheduler-add'.
If ARG is positive or nil, enable, if it is negative, disable.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "idutils" "symref/idutils.el" (20746 56154))
;;; Generated autoloads from symref/idutils.el

(defclass semantic-symref-tool-idutils (semantic-symref-tool-baseclass) nil "A symref tool implementation using ID Utils.\nThe udutils command set can be used to generate lists of tags in a way\nsimilar to that of `grep'.  This tool will parse the output to generate\nthe hit list.\n\nSee the function `cedet-idutils-search' for more details.")

;;;***

;;;### (autoloads (semantic-create-imenu-index semantic-imenu-expand-type-members
;;;;;;  semantic-imenu-bucketize-file semantic-imenu-summary-function)
;;;;;;  "imenu" "imenu.el" (20746 56154))
;;; Generated autoloads from imenu.el

(defvar semantic-imenu-summary-function (quote semantic-format-tag-abbreviate) "\
*Function to use when creating items in Imenu.
Some useful functions are found in `semantic-format-tag-functions'.")

(custom-autoload (quote semantic-imenu-summary-function) "imenu" t)

(defvar semantic-imenu-bucketize-file t "\
*Non-nil if tags in a file are to be grouped into buckets.")

(custom-autoload (quote semantic-imenu-bucketize-file) "imenu" t)

(defvar semantic-imenu-expand-type-members t "\
*Non-nil if types should have submenus with members in them.")

(custom-autoload (quote semantic-imenu-expand-type-members) "imenu" t)

(defvar semantic-imenu-expandable-tag-classes (quote (type)) "\
List of expandable tag classes.
Tags of those classes will be given submenu with children.
By default, a `type' has interesting children.  In Texinfo, however, a
`section' has interesting children.")

(autoload (quote semantic-create-imenu-index) "imenu" "\
Create an imenu index for any buffer which supports Semantic.
Uses the output of the Semantic parser to create the index.
Optional argument STREAM is an optional stream of tags used to create menus.

\(fn &optional STREAM)" nil nil)

;;;***

;;;### (autoloads (semantic-decoration-unparsed-include-do-reset
;;;;;;  semantic-decoration-include-visit) "include" "decorate/include.el"
;;;;;;  (21134 29786))
;;; Generated autoloads from decorate/include.el

(autoload (quote semantic-decoration-include-visit) "include" "\
Visit the included file at point.

\(fn)" t nil)

(autoload (quote semantic-decoration-unparsed-include-do-reset) "include" "\
Do a reset of unparsed includes in the current buffer.

\(fn)" nil nil)

;;;***

;;;### (autoloads (wisent-java-default-setup) "java-tags" "wisent/java-tags.el"
;;;;;;  (20746 56154))
;;; Generated autoloads from wisent/java-tags.el

(autoload (quote wisent-java-default-setup) "java-tags" "\
Hook run to setup Semantic in `java-mode'.
Use the alternate LALR(1) parser.

\(fn)" nil nil)

;;;***

;;;### (autoloads (wisent-javascript-setup-parser) "javascript" "wisent/javascript.el"
;;;;;;  (20746 56154))
;;; Generated autoloads from wisent/javascript.el

(autoload (quote wisent-javascript-setup-parser) "javascript" "\
Setup buffer for parse.

\(fn)" nil nil)

;;;***

;;;### (autoloads (semantic-load-enable-primary-ectags-support) "lang"
;;;;;;  "ectags/lang.el" (20580 44388))
;;; Generated autoloads from ectags/lang.el

(autoload (quote semantic-load-enable-primary-ectags-support) "lang" "\
Enable all ectags supported parsers for new languages.
This is support for any language that does not have a regular
semantic parser.

\(fn)" t nil)

;;;***

;;;### (autoloads (semantic-load-enable-secondary-ectags-support)
;;;;;;  "lang2" "ectags/lang2.el" (20580 44388))
;;; Generated autoloads from ectags/lang2.el

(autoload (quote semantic-load-enable-secondary-ectags-support) "lang2" "\
Enable exuberant ctags support as a secondary parser.
This is for semanticdb out-of-buffer parsing support.
Any mode that has been tested to work will be added to this function.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "lex" "lex.el" (20979 61065))
;;; Generated autoloads from lex.el

(define-overloadable-function semantic-lex (start end &optional depth length) "\
Lexically analyze text in the current buffer between START and END.
Optional argument DEPTH indicates at what level to scan over entire
lists.  The last argument, LENGTH specifies that `semantic-lex'
should only return LENGTH tokens.  The return value is a token stream.
Each element is a list, such of the form
  (symbol start-expression .  end-expression)
where SYMBOL denotes the token type.
See `semantic-lex-tokens' variable for details on token types.  END
does not mark the end of the text scanned, only the end of the
beginning of text scanned.  Thus, if a string extends past END, the
end of the return token will be larger than END.  To truly restrict
scanning, use `narrow-to-region'." (funcall semantic-lex-analyzer start end depth length))

;;;***

;;;### (autoloads (semantic-lex-spp-table-write-slot-value) "lex-spp"
;;;;;;  "lex-spp.el" (21111 65044))
;;; Generated autoloads from lex-spp.el

(autoload (quote semantic-lex-spp-table-write-slot-value) "lex-spp" "\
Write out the VALUE of a slot for EIEIO.
The VALUE is a spp lexical table.

\(fn VALUE)" nil nil)

;;;***

;;;### (autoloads (semantic-symref-regexp semantic-symref-symbol
;;;;;;  semantic-symref) "list" "symref/list.el" (20908 48525))
;;; Generated autoloads from symref/list.el

(autoload (quote semantic-symref) "list" "\
Find references to the current tag.
This command uses the currently configured references tool within the
current project to find references to the current tag.  The
references are organized by file and the name of the function
they are used in.
Display the references in `semantic-symref-results-mode'.

\(fn)" t nil)

(autoload (quote semantic-symref-symbol) "list" "\
Find references to the symbol SYM.
This command uses the currently configured references tool within the
current project to find references to the input SYM.  The
references are organized by file and the name of the function
they are used in.
Display the references in `semantic-symref-results-mode'.

\(fn SYM)" t nil)

(autoload (quote semantic-symref-regexp) "list" "\
Find references to the a symbol regexp SYM.
This command uses the currently configured references tool within the
current project to find references to the input SYM.  The
references are the organized by file and the name of the function
they are used in.
Display the references in`semantic-symref-results-mode'.

\(fn SYM)" t nil)

;;;***

;;;### (autoloads (semantic-m3-ref-items semantic-m3-context-items
;;;;;;  semantic-m3-add-whatisit semantic-m3-install) "m3" "m3.el"
;;;;;;  (20580 44388))
;;; Generated autoloads from m3.el

(autoload (quote semantic-m3-install) "m3" "\
Install ourselves into the `cedet-m3' system.

\(fn)" t nil)

(autoload (quote semantic-m3-add-whatisit) "m3" "\
Return a menu item for the 'whatisit' function.

\(fn)" nil nil)

(autoload (quote semantic-m3-context-items) "m3" "\
Return a list of menu items if the cursor is on some useful code constrct.

\(fn)" nil nil)

(autoload (quote semantic-m3-ref-items) "m3" "\
Return a list of menu items for dealing with analyzer refs.

\(fn)" nil nil)

;;;***

;;;### (autoloads (semantic-default-make-setup) "make" "bovine/make.el"
;;;;;;  (20746 56154))
;;; Generated autoloads from bovine/make.el

(autoload (quote semantic-default-make-setup) "make" "\
Set up a Makefile buffer for parsing with semantic.

\(fn)" nil nil)

;;;***

;;;### (autoloads (global-semantic-decoration-mode) "mode" "decorate/mode.el"
;;;;;;  (21134 29786))
;;; Generated autoloads from decorate/mode.el

(defvar global-semantic-decoration-mode nil "\
Non-nil if Global-Semantic-Decoration mode is enabled.
See the command `global-semantic-decoration-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-semantic-decoration-mode'.")

(custom-autoload (quote global-semantic-decoration-mode) "mode" nil)

(autoload (quote global-semantic-decoration-mode) "mode" "\
Toggle global use of option `semantic-decoration-mode'.
Decoration mode turns on all active decorations as specified
by `semantic-decoration-styles'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (global-semantic-mru-bookmark-mode) "mru-bookmark"
;;;;;;  "mru-bookmark.el" (20746 56154))
;;; Generated autoloads from mru-bookmark.el

(defvar global-semantic-mru-bookmark-mode nil "\
Non-nil if Global-Semantic-Mru-Bookmark mode is enabled.
See the command `global-semantic-mru-bookmark-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-semantic-mru-bookmark-mode'.")

(custom-autoload (quote global-semantic-mru-bookmark-mode) "mru-bookmark" nil)

(autoload (quote global-semantic-mru-bookmark-mode) "mru-bookmark" "\
Toggle global use of option `semantic-mru-bookmark-mode'.
If ARG is positive or nil, enable, if it is negative, disable.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (semantic-ectags-parse-buffer) "parse" "ectags/parse.el"
;;;;;;  (20981 1996))
;;; Generated autoloads from ectags/parse.el

(autoload (quote semantic-ectags-parse-buffer) "parse" "\
Execute Exuberant CTags on this buffer.
Convert the output tags into Semantic tags.

\(fn)" t nil)

;;;***

;;;### (autoloads (wisent-python-default-setup) "python" "wisent/python.el"
;;;;;;  (20981 1996))
;;; Generated autoloads from wisent/python.el

(autoload (quote wisent-python-default-setup) "python" "\
Setup buffer for parse.

\(fn)" nil nil)

(add-hook (quote python-mode-hook) (quote wisent-python-default-setup))

;;;***

;;;### (autoloads (semantic-analyze-proto-impl-toggle semantic-analyze-current-tag)
;;;;;;  "refs" "analyze/refs.el" (21053 42602))
;;; Generated autoloads from analyze/refs.el

(autoload (quote semantic-analyze-current-tag) "refs" "\
Analyze the tag under point.

\(fn)" t nil)

(autoload (quote semantic-analyze-proto-impl-toggle) "refs" "\
Toggle between the implementation, and a prototype of tag under point.

\(fn)" t nil)

;;;***

;;;### (autoloads (semantic-default-scheme-setup) "scm" "bovine/scm.el"
;;;;;;  (20746 56154))
;;; Generated autoloads from bovine/scm.el

(autoload (quote semantic-default-scheme-setup) "scm" "\
Setup hook function for Emacs Lisp files and Semantic.

\(fn)" nil nil)

;;;***

;;;### (autoloads (semantic-calculate-scope) "scope" "scope.el" (21134
;;;;;;  31585))
;;; Generated autoloads from scope.el

(autoload (quote semantic-calculate-scope) "scope" "\
Calculate the scope at POINT.
If POINT is not provided, then use the current location of point.
The class returned from the scope calculation is variable
`semantic-scope-cache'.

\(fn &optional POINT)" t nil)

;;;***

;;;### (autoloads (senator-transpose-tags-down senator-transpose-tags-up
;;;;;;  senator-copy-tag-to-register senator-yank-tag senator-kill-tag
;;;;;;  senator-copy-tag senator-go-to-up-reference senator-search-forward
;;;;;;  senator-completion-menu-popup senator-complete-symbol senator-jump-regexp
;;;;;;  senator-jump senator-previous-tag senator-next-tag senator-step-at-start-end-tag-classes
;;;;;;  senator-step-at-tag-classes) "senator" "senator.el" (20981
;;;;;;  1996))
;;; Generated autoloads from senator.el

(defvar senator-step-at-tag-classes nil "\
List of tag classes recognized by Senator's navigation commands.
A tag class is a symbol, such as `variable', `function', or `type'.

As a special exception, if the value is nil, Senator's navigation
commands recognize all tag classes.")

(custom-autoload (quote senator-step-at-tag-classes) "senator" t)

(make-variable-buffer-local (quote senator-step-at-tag-classes))

(defvar senator-step-at-start-end-tag-classes nil "\
List of tag classes at which Senator's navigation commands should stop.
A tag class is a symbol, such as `variable', `function', or `type'.
The navigation commands stop at the start and end of each tag
class in this list, provided the tag class is recognized (see
`senator-step-at-tag-classes').

As a special exception, if the value is nil, the navigation
commands stop at the beginning of every tag.

If t, the navigation commands stop at the start and end of any
tag, where possible.")

(custom-autoload (quote senator-step-at-start-end-tag-classes) "senator" t)

(make-variable-buffer-local (quote senator-step-at-start-end-tag-classes))

(autoload (quote senator-next-tag) "senator" "\
Navigate to the next Semantic tag.
Return the tag or nil if at end of buffer.

\(fn)" t nil)

(autoload (quote senator-previous-tag) "senator" "\
Navigate to the previous Semantic tag.
Return the tag or nil if at beginning of buffer.

\(fn)" t nil)

(autoload (quote senator-jump) "senator" "\
Jump to the semantic symbol SYM.

If optional IN-CONTEXT is non-nil jump in the local type's context
\(see function `senator-current-type-context').  If optional
NO-DEFAULT is non-nil do not provide a default value.

When called interactively you can combine the IN-CONTEXT and
NO-DEFAULT switches like this:

- \\[universal-argument]       IN-CONTEXT.
- \\[universal-argument] -     NO-DEFAULT.
- \\[universal-argument] \\[universal-argument]   IN-CONTEXT + NO-DEFAULT.

\(fn SYM &optional IN-CONTEXT NO-DEFAULT)" t nil)

(autoload (quote senator-jump-regexp) "senator" "\
Jump to the semantic symbol SYMREGEX.
SYMREGEX is treated as a regular expression.

If optional IN-CONTEXT is non-nil jump in the local type's context
\(see function `senator-current-type-context').  If optional
NO-DEFAULT is non-nil do not provide a default value and move to the
next match of SYMREGEX.  NOTE: Doesn't actually work yet.

When called interactively you can combine the IN-CONTEXT and
NO-DEFAULT switches like this:

- \\[universal-argument]       IN-CONTEXT.
- \\[universal-argument] -     NO-DEFAULT.
- \\[universal-argument] \\[universal-argument]   IN-CONTEXT + NO-DEFAULT.

\(fn SYMREGEX &optional IN-CONTEXT NO-DEFAULT)" t nil)

(autoload (quote senator-complete-symbol) "senator" "\
Complete the current symbol under point.
If optional argument CYCLE-ONCE is non-nil, only cycle through the list
of completions once, doing nothing where there are no more matches.

\(fn &optional CYCLE-ONCE)" t nil)

(autoload (quote senator-completion-menu-popup) "senator" "\
Popup a completion menu for the symbol at point.
The popup menu displays all of the possible completions for the symbol
it was invoked on.  To automatically split large menus this function
use `imenu--mouse-menu' to handle the popup menu.

\(fn)" t nil)

(autoload (quote senator-search-forward) "senator" "\
Search in tag names forward from point for STRING.
Set point to the end of the occurrence found, and return point.
See also the function `search-forward' for details on the BOUND,
NOERROR and COUNT arguments.

\(fn STRING &optional BOUND NOERROR COUNT)" t nil)

(autoload (quote senator-go-to-up-reference) "senator" "\
Move up one reference from the current TAG.
A \"reference\" could be any interesting feature of TAG.
In C++, a function may have a 'parent' which is non-local.
If that parent which is only a reference in the function tag
is found, we can jump to it.
Some tags such as includes have other reference features.

\(fn &optional TAG)" t nil)

(autoload (quote senator-copy-tag) "senator" "\
Take the current tag, and place it in the tag ring.

\(fn)" t nil)

(autoload (quote senator-kill-tag) "senator" "\
Take the current tag, place it in the tag ring, and kill it.
Killing the tag removes the text for that tag, and places it into
the kill ring.  Retrieve that text with \\[yank].

\(fn)" t nil)

(autoload (quote senator-yank-tag) "senator" "\
Yank a tag from the tag ring.
The form the tag takes is different depending on where it is being
yanked to.

\(fn)" t nil)

(autoload (quote senator-copy-tag-to-register) "senator" "\
Copy the current tag into REGISTER.
Optional argument KILL-FLAG will delete the text of the tag to the
kill ring.

\(fn REGISTER &optional KILL-FLAG)" t nil)

(autoload (quote senator-transpose-tags-up) "senator" "\
Transpose the current tag, and the preceding tag.

\(fn)" t nil)

(autoload (quote senator-transpose-tags-down) "senator" "\
Transpose the current tag, and the following tag.

\(fn)" t nil)

;;;***

;;;### (autoloads (semantic-flatten-tags-table) "sort" "sort.el"
;;;;;;  (20710 22649))
;;; Generated autoloads from sort.el

(autoload (quote semantic-flatten-tags-table) "sort" "\
Flatten the tags table TABLE.
All tags in TABLE, and all components of top level tags
in TABLE will appear at the top level of list.
Tags promoted to the top of the list will still appear
unmodified as components of their parent tags.

\(fn &optional TABLE)" nil nil)

(define-overloadable-function semantic-tag-external-member-parent (tag) "\
Return a parent for TAG when TAG is an external member.
TAG is an external member if it is defined at a toplevel and
has some sort of label defining a parent.  The parent return will
be a string.

The default behavior, if not overridden with
`tag-member-parent' gets the 'parent extra
specifier of TAG.

If this function is overridden, use
`semantic-tag-external-member-parent-default' to also
include the default behavior, and merely extend your own.")

;;;***

;;;### (autoloads (semantic-symref-find-text semantic-symref-find-file-references-by-name
;;;;;;  semantic-symref-find-tags-by-completion semantic-symref-find-tags-by-regexp
;;;;;;  semantic-symref-find-tags-by-name semantic-symref-find-references-by-name)
;;;;;;  "symref" "symref.el" (20981 1996))
;;; Generated autoloads from symref.el

(autoload (quote semantic-symref-find-references-by-name) "symref" "\
Find a list of references to NAME in the current project.
Optional SCOPE specifies which file set to search.  Defaults to 'project.
Refers to `semantic-symref-tool', to determine the reference tool to use
for the current buffer.
Returns an object of class `semantic-symref-result'.
TOOL-RETURN is an optional symbol, which will be assigned the tool used
to perform the search.  This was added for use by a test harness.

\(fn NAME &optional SCOPE TOOL-RETURN)" t nil)

(autoload (quote semantic-symref-find-tags-by-name) "symref" "\
Find a list of tags by NAME in the current project.
Optional SCOPE specifies which file set to search.  Defaults to 'project.
Refers to `semantic-symref-tool', to determine the reference tool to use
for the current buffer.
Returns an object of class `semantic-symref-result'.

\(fn NAME &optional SCOPE)" t nil)

(autoload (quote semantic-symref-find-tags-by-regexp) "symref" "\
Find a list of references to NAME in the current project.
Optional SCOPE specifies which file set to search.  Defaults to 'project.
Refers to `semantic-symref-tool', to determine the reference tool to use
for the current buffer.
Returns an object of class `semantic-symref-result'.

\(fn NAME &optional SCOPE)" t nil)

(autoload (quote semantic-symref-find-tags-by-completion) "symref" "\
Find a list of references to NAME in the current project.
Optional SCOPE specifies which file set to search.  Defaults to 'project.
Refers to `semantic-symref-tool', to determine the reference tool to use
for the current buffer.
Returns an object of class `semantic-symref-result'.

\(fn NAME &optional SCOPE)" t nil)

(autoload (quote semantic-symref-find-file-references-by-name) "symref" "\
Find a list of references to NAME in the current project.
Optional SCOPE specifies which file set to search.  Defaults to 'project.
Refers to `semantic-symref-tool', to determine the reference tool to use
for the current buffer.
Returns an object of class `semantic-symref-result'.

\(fn NAME &optional SCOPE)" t nil)

(autoload (quote semantic-symref-find-text) "symref" "\
Find a list of occurrences of TEXT in the current project.
TEXT is a regexp formatted for use with egrep.
Optional SCOPE specifies which file set to search.  Defaults to 'project.
Refers to `semantic-symref-tool', to determine the reference tool to use
for the current buffer.
Returns an object of class `semantic-symref-result'.

\(fn TEXT &optional SCOPE)" t nil)

;;;***

;;;### (autoloads nil "tag" "tag.el" (20746 56154))
;;; Generated autoloads from tag.el

(define-overloadable-function semantic-tag-components (tag) "\
Return a list of components for TAG.
A Component is a part of TAG which itself may be a TAG.
Examples include the elements of a structure in a
tag of class `type, or the list of arguments to a
tag of class 'function.")

;;;***

;;;### (autoloads nil "tag-file" "tag-file.el" (20746 56154))
;;; Generated autoloads from tag-file.el

(define-overloadable-function semantic-go-to-tag (tag &optional parent) "\
Go to the location of TAG.
TAG may be a stripped element, in which case PARENT specifies a
parent tag that has position information.
PARENT can also be a `semanticdb-table' object." (:override (save-match-data (cond ((semantic-tag-in-buffer-p tag) (set-buffer (semantic-tag-buffer tag))) ((semantic-tag-file-name tag) (set-buffer (find-file-noselect (semantic-tag-file-name tag)))) ((and parent (semantic-tag-p parent) (semantic-tag-in-buffer-p parent)) (set-buffer (semantic-tag-buffer parent))) ((and parent (semantic-tag-p parent) (semantic-tag-file-name parent)) (set-buffer (find-file-noselect (semantic-tag-file-name parent)))) ((and parent (featurep (quote semantic/db)) (semanticdb-table-child-p parent)) (set-buffer (semanticdb-get-buffer parent))) (t nil))) (cond ((semantic-tag-with-position-p tag) (goto-char (semantic-tag-start tag))) ((semantic-tag-with-position-p parent) (goto-char (semantic-tag-start parent)) (re-search-forward (semantic-tag-name tag) (semantic-tag-end parent) t)) ((semantic-tag-get-attribute tag :line) (goto-char (point-min)) (forward-line (1- (semantic-tag-get-attribute tag :line)))) ((and (semantic-tag-p parent) (semantic-tag-get-attribute parent :line)) (goto-char (point-min)) (forward-line (1- (semantic-tag-get-attribute parent :line))) (re-search-forward (semantic-tag-name tag) nil t)) (t (goto-char (point-min)) (re-search-forward (semantic-tag-name tag) nil t)))))

(define-overloadable-function semantic-dependency-tag-file (&optional tag) "\
Find the filename represented from TAG.
Depends on `semantic-dependency-include-path' for searching.  Always searches
`.' first, then searches additional paths." (or tag (setq tag (car (semantic-find-tag-by-overlay nil)))) (unless (semantic-tag-of-class-p tag (quote include)) (signal (quote wrong-type-argument) (list tag (quote include)))) (save-excursion (let ((result nil) (default-directory default-directory) (edefind nil) (tag-fname nil)) (cond ((semantic-tag-in-buffer-p tag) (set-buffer (semantic-tag-buffer tag))) ((semantic-tag-file-name tag) (setq default-directory (file-name-directory (semantic-tag-file-name tag))))) (setq tag-fname (semantic-tag-include-filename tag)) (if (and (fboundp (quote ede-expand-filename)) ede-minor-mode (setq edefind (condition-case nil (let ((proj (ede-toplevel))) (when proj (ede-expand-filename proj tag-fname))) (error nil)))) (setq result edefind)) (if (not result) (setq result (:override (save-excursion (require (quote semantic/dep)) (semantic-dependency-find-file-on-path tag-fname (semantic-tag-include-system-p tag)))))) (if (stringp result) (progn (semantic--tag-put-property tag (quote dependency-file) result) result) nil))))

;;;***

;;;### (autoloads nil "tag-ls" "tag-ls.el" (20908 48525))
;;; Generated autoloads from tag-ls.el

(define-overloadable-function semantic-tag-prototype-p (tag) "\
Return non nil if TAG is a prototype.
For some languages, such as C, a prototype is a declaration of
something without an implementation.")

;;;***

;;;### (autoloads (semantic-tag-write-list-slot-value) "tag-write"
;;;;;;  "tag-write.el" (20746 56154))
;;; Generated autoloads from tag-write.el

(autoload (quote semantic-tag-write-list-slot-value) "tag-write" "\
Write out the VALUE of a slot for EIEIO.
The VALUE is a list of tags.

\(fn VALUE)" nil nil)

;;;***

;;;### (autoloads (semantic-default-texi-setup) "texi" "texi.el"
;;;;;;  (20746 56154))
;;; Generated autoloads from texi.el

(autoload (quote semantic-default-texi-setup) "texi" "\
Set up a buffer for parsing of Texinfo files.

\(fn)" nil nil)

;;;***

;;;### (autoloads (cedet-ectag-version-check) "util" "ectags/util.el"
;;;;;;  (21086 57913))
;;; Generated autoloads from ectags/util.el

(autoload (quote cedet-ectag-version-check) "util" "\
Check the version of the installed ctags command.
If optional programatic argument NOERROR is non-nil, then
instead of throwing an error if ctags isn't available, then
return nil.

\(fn &optional NOERROR)" t nil)

;;;***

;;;### (autoloads (semantic-highlight-func-mode global-semantic-highlight-func-mode
;;;;;;  semantic-stickyfunc-mode global-semantic-stickyfunc-mode
;;;;;;  semantic-show-parser-state-mode global-semantic-show-parser-state-mode
;;;;;;  semantic-show-unmatched-syntax-mode global-semantic-show-unmatched-syntax-mode
;;;;;;  semantic-highlight-edits-mode global-semantic-highlight-edits-mode)
;;;;;;  "util-modes" "util-modes.el" (20746 56154))
;;; Generated autoloads from util-modes.el

(defvar global-semantic-highlight-edits-mode nil "\
Non-nil if Global-Semantic-Highlight-Edits mode is enabled.
See the command `global-semantic-highlight-edits-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-semantic-highlight-edits-mode'.")

(custom-autoload (quote global-semantic-highlight-edits-mode) "util-modes" nil)

(autoload (quote global-semantic-highlight-edits-mode) "util-modes" "\
Toggle global use of option `semantic-highlight-edits-mode'.
If ARG is positive or nil, enable, if it is negative, disable.

\(fn &optional ARG)" t nil)

(autoload (quote semantic-highlight-edits-mode) "util-modes" "\
Minor mode for highlighting changes made in a buffer.
Changes are tracked by semantic so that the incremental parser can work
properly.
This mode will highlight those changes as they are made, and clear them
when the incremental parser accounts for those edits.
With prefix argument ARG, turn on if positive, otherwise off.  The
minor mode can be turned on only if semantic feature is available and
the current buffer was set up for parsing.  Return non-nil if the
minor mode is enabled.

\(fn &optional ARG)" t nil)

(defvar global-semantic-show-unmatched-syntax-mode nil "\
Non-nil if Global-Semantic-Show-Unmatched-Syntax mode is enabled.
See the command `global-semantic-show-unmatched-syntax-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-semantic-show-unmatched-syntax-mode'.")

(custom-autoload (quote global-semantic-show-unmatched-syntax-mode) "util-modes" nil)

(autoload (quote global-semantic-show-unmatched-syntax-mode) "util-modes" "\
Toggle global use of option `semantic-show-unmatched-syntax-mode'.
If ARG is positive or nil, enable, if it is negative, disable.

\(fn &optional ARG)" t nil)

(autoload (quote semantic-show-unmatched-syntax-mode) "util-modes" "\
Minor mode to highlight unmatched lexical syntax tokens.
When a parser executes, some elements in the buffer may not match any
parser rules.  These text characters are considered unmatched syntax.
Often time, the display of unmatched syntax can expose coding
problems before the compiler is run.

With prefix argument ARG, turn on if positive, otherwise off.  The
minor mode can be turned on only if semantic feature is available and
the current buffer was set up for parsing.  Return non-nil if the
minor mode is enabled.

\\{semantic-show-unmatched-syntax-mode-map}

\(fn &optional ARG)" t nil)

(defvar global-semantic-show-parser-state-mode nil "\
Non-nil if Global-Semantic-Show-Parser-State mode is enabled.
See the command `global-semantic-show-parser-state-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-semantic-show-parser-state-mode'.")

(custom-autoload (quote global-semantic-show-parser-state-mode) "util-modes" nil)

(autoload (quote global-semantic-show-parser-state-mode) "util-modes" "\
Toggle global use of option `semantic-show-parser-state-mode'.
If ARG is positive or nil, enable, if it is negative, disable.

\(fn &optional ARG)" t nil)

(autoload (quote semantic-show-parser-state-mode) "util-modes" "\
Minor mode for displaying parser cache state in the modeline.
The cache can be in one of three states.  They are
Up to date, Partial reparse needed, and Full reparse needed.
The state is indicated in the modeline with the following characters:
 `-'  ->  The cache is up to date.
 `!'  ->  The cache requires a full update.
 `~'  ->  The cache needs to be incrementally parsed.
 `%'  ->  The cache is not currently parsable.
 `@'  ->  Auto-parse in progress (not set here.)
With prefix argument ARG, turn on if positive, otherwise off.  The
minor mode can be turned on only if semantic feature is available and
the current buffer was set up for parsing.  Return non-nil if the
minor mode is enabled.

\(fn &optional ARG)" t nil)

(defvar global-semantic-stickyfunc-mode nil "\
Non-nil if Global-Semantic-Stickyfunc mode is enabled.
See the command `global-semantic-stickyfunc-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-semantic-stickyfunc-mode'.")

(custom-autoload (quote global-semantic-stickyfunc-mode) "util-modes" nil)

(autoload (quote global-semantic-stickyfunc-mode) "util-modes" "\
Toggle global use of option `semantic-stickyfunc-mode'.
If ARG is positive or nil, enable, if it is negative, disable.

\(fn &optional ARG)" t nil)

(autoload (quote semantic-stickyfunc-mode) "util-modes" "\
Minor mode to show the title of a tag in the header line.
Enables/disables making the header line of functions sticky.
A function (or other tag class specified by
`semantic-stickyfunc-sticky-classes') has a header line, meaning the
first line which describes the rest of the construct.  This first
line is what is displayed in the header line.

With prefix argument ARG, turn on if positive, otherwise off.  The
minor mode can be turned on only if semantic feature is available and
the current buffer was set up for parsing.  Return non-nil if the
minor mode is enabled.

\(fn &optional ARG)" t nil)

(defvar global-semantic-highlight-func-mode nil "\
Non-nil if Global-Semantic-Highlight-Func mode is enabled.
See the command `global-semantic-highlight-func-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-semantic-highlight-func-mode'.")

(custom-autoload (quote global-semantic-highlight-func-mode) "util-modes" nil)

(autoload (quote global-semantic-highlight-func-mode) "util-modes" "\
Toggle global use of option `semantic-highlight-func-mode'.
If ARG is positive or nil, enable, if it is negative, disable.

\(fn &optional ARG)" t nil)

(autoload (quote semantic-highlight-func-mode) "util-modes" "\
Minor mode to highlight the first line of the current tag.
Enables/disables making the current function's first line light up.
A function (or other tag class specified by
`semantic-stickyfunc-sticky-classes') is highlighted, meaning the
first line which describes the rest of the construct.

See `semantic-stickyfunc-mode' for putting a function in the
header line.  This mode recycles the stickyfunc configuration
classes list.

With prefix argument ARG, turn on if positive, otherwise off.  The
minor mode can be turned on only if semantic feature is available and
the current buffer was set up for parsing.  Return non-nil if the
minor mode is enabled.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("analyze/fcn.el" "ast.el" "bovine/erlang.el"
;;;;;;  "bovine/grammar-macros.el" "canned-configs.el" "chart.el"
;;;;;;  "db-debug.el" "db-ebrowse.el" "db-el.el" "db-javascript.el"
;;;;;;  "db-mk.el" "db-ref.el" "decorate.el" "ede-grammar.el" "fw.el"
;;;;;;  "gram-wy-fallback.el" "grammar.el" "java.el" "sb.el" "symref/filter.el"
;;;;;;  "util.el" "wisent.el" "wisent/comp.el" "wisent/expr.el" "wisent/grammar-macros.el"
;;;;;;  "wisent/java.el" "wisent/wisent.el") (21169 32246 340700))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; loaddefs.el ends here

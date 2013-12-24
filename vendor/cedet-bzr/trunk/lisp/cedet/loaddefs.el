;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (cedet-android-sdk-update-classpath cedet-android-adb-shell
;;;;;;  cedet-android-adb-version-check cedet-android-adb-devices
;;;;;;  cedet-android-adb-help cedet-android-start-ddms cedet-android-layoutopt
;;;;;;  cedet-android-target-list cedet-android-create-project) "cedet-android"
;;;;;;  "cedet-android.el" (20981 1996))
;;; Generated autoloads from cedet-android.el

(autoload (quote cedet-android-create-project) "cedet-android" "\
Create an android project with NAME.
Your activity class will be created in the java PACKAGE.
You need to specify a TARGET, which is a number specifying the desired type
of package you intend to build.
Create the project in optional DIR, or in the default directory if not specified.
NAME will be used as the name of the project.

\(fn NAME PACKAGE TARGET &optional DIR)" t nil)

(autoload (quote cedet-android-target-list) "cedet-android" "\
Get the list of available targets for an android environment.

\(fn)" t nil)

(autoload (quote cedet-android-layoutopt) "cedet-android" "\
Get the list of available targets for an android environment.
Argument PROJECTROOT is the directory root of some project to be optimized.

\(fn PROJECTROOT)" t nil)

(autoload (quote cedet-android-start-ddms) "cedet-android" "\
Start Android's ddms debugging proxy.

\(fn)" t nil)

(autoload (quote cedet-android-adb-help) "cedet-android" "\
Get help for Android Debug Bridge.

\(fn)" t nil)

(autoload (quote cedet-android-adb-devices) "cedet-android" "\
The the list of attached devices from Android Debug Bridge.

\(fn)" t nil)

(autoload (quote cedet-android-adb-version-check) "cedet-android" "\
Check the version of the installed Android ADB command.
If optional programatic argument NOERROR is non-nil, then
instead of throwing an error if Global isn't available, then
return nil.

\(fn &optional NOERROR)" t nil)

(autoload (quote cedet-android-adb-shell) "cedet-android" "\
Create an inferior shell for Android Debug Bridge.

\(fn)" t nil)

(autoload (quote cedet-android-sdk-update-classpath) "cedet-android" "\
Update the classpath for `cedet-java' to include the android compile-time libraries.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "cedet-edebug" "cedet-edebug.el" (20580 44388))
;;; Generated autoloads from cedet-edebug.el

(add-hook (quote edebug-setup-hook) (lambda nil (require (quote cedet-edebug)) (defalias (quote edebug-prin1-to-string) (quote cedet-edebug-prin1-to-string)) (define-key edebug-mode-map "A" (quote data-debug-edebug-expr))))

(add-hook (quote debugger-mode-hook) (lambda nil (require (quote cedet-edebug)) (define-key debugger-mode-map "A" (quote data-debug-edebug-expr))))

;;;***

;;;### (autoloads (cedet-gnu-global-version-check) "cedet-global"
;;;;;;  "cedet-global.el" (20981 1996))
;;; Generated autoloads from cedet-global.el

(autoload (quote cedet-gnu-global-version-check) "cedet-global" "\
Check the version of the installed GNU Global command.
If optional programmatic argument NOERROR is non-nil,
then instead of throwing an error if Global isn't available,
return nil.

\(fn &optional NOERROR)" t nil)

;;;***

;;;### (autoloads (cedet-graphviz-dot-version-check cedet-graphviz-neato-command
;;;;;;  cedet-graphviz-dot-command) "cedet-graphviz" "cedet-graphviz.el"
;;;;;;  (20981 1996))
;;; Generated autoloads from cedet-graphviz.el

(defvar cedet-graphviz-dot-command "dot" "\
Command name for the Graphviz DOT executable.")

(custom-autoload (quote cedet-graphviz-dot-command) "cedet-graphviz" t)

(defvar cedet-graphviz-neato-command "neato" "\
Command name for the Graphviz NEATO executable.")

(custom-autoload (quote cedet-graphviz-neato-command) "cedet-graphviz" t)

(autoload (quote cedet-graphviz-dot-version-check) "cedet-graphviz" "\
Check the version of the installed Graphviz dot command.
If optional programatic argument NOERROR is non-nil, then
instead of throwing an error if Global isn't available, then
return nil.

\(fn &optional NOERROR)" t nil)

;;;***

;;;### (autoloads (cedet-javap-dump-class cedet-java-version-check)
;;;;;;  "cedet-java" "cedet-java.el" (20981 1996))
;;; Generated autoloads from cedet-java.el

(autoload (quote cedet-java-version-check) "cedet-java" "\
Check the version of the installed java command.
If optional programatic argument NOERROR is non-nil, then
instead of throwing an error if Global isn't available, then
return nil.

\(fn &optional NOERROR)" t nil)

(autoload (quote cedet-javap-dump-class) "cedet-java" "\
Dump out a Java signatures for CLASS.
Display in a javap output buffer.

\(fn CLASS)" t nil)

;;;***

;;;### (autoloads (global-cedet-m3-minor-mode cedet-m3-minor-mode)
;;;;;;  "cedet-m3" "cedet-m3.el" (20580 44388))
;;; Generated autoloads from cedet-m3.el

(autoload (quote cedet-m3-minor-mode) "cedet-m3" "\
Toggle cedet-m3 minor mode, a mouse 3 context menu.
With prefix argument ARG, turn on if positive, otherwise off.
Return non-nil if the minor mode is enabled.

\\{cedet-m3-mode-map}

\(fn &optional ARG)" t nil)

(defvar global-cedet-m3-minor-mode nil "\
Non-nil if Global-Cedet-M3 minor mode is enabled.
See the command `global-cedet-m3-minor-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-cedet-m3-minor-mode'.")

(custom-autoload (quote global-cedet-m3-minor-mode) "cedet-m3" nil)

(autoload (quote global-cedet-m3-minor-mode) "cedet-m3" "\
Toggle global use of cedet-m3 minor mode.
If ARG is positive, enable, if it is negative, disable.
If ARG is nil, then toggle.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (cogre) "cogre" "cogre.el" (20981 1996))
;;; Generated autoloads from cogre.el

(defclass cogre-graph-element (eieio-named) ((dirty :initform t :documentation "Non-nil if this graph element is dirty.\nElements are made dirty when they are erased from the screen.\nElements must be erased before any graphical fields are changed.") (name-default :initform "Name" :type string :custom string :allocation :class :documentation "The object-name of this node.\nNode object-names must be unique within the current graph so that save\nreferences in links can be restored.") (peer :initarg :peer :initform nil :type (or null cogre-element-peer) :documentation "The peer for this graph.")) "A Graph Element.\nGraph elements are anything that is drawn into a `cogre-base-graph'.\nGraph elements have a method for marking themselves dirty." :abstract t)

(defclass cogre-base-graph (eieio-persistent) ((extension :initform ".cgr") (name :initarg :name :initform "NewGraph" :type string :custom string :documentation "The name of this graph.\nThe save file name is based on this name.") (buffer :initform nil :type (or null buffer) :documentation "When this graph is active, this is the buffer the graph is\ndisplayed in.") (peer :initarg :peer :initform nil :type (or null cogre-element-peer) :documentation "The peer for this graph.") (major-mode :initarg :major-mode :initform fundamental-mode :type symbol :custom (choice (const emacs-lisp-mode) (const c++-mode) (const c-mode) (const java-mode) (symbol)) :documentation "Mode used for any mode-specific function calls.\nUsed when calling some mode-local functions.") (detail :initarg :detail :initform 0 :type number :custom (choice (const :tag "Max Detail" 0) (const :tag "Less Detail" 1) (const :tag "Not Much Detail" 2) (const :tag "No Detail" 3)) :documentation "A flag for items being rendered on how much detail to show.\nA 0 means to show everything.\nA 1 means to show a little bit less.\nA 2 means to show less than that.\nA 3 means just the package and name.") (elements :initarg :elements :initform nil :type cogre-graph-element-list :documentation "The list of elements in this graph.")) "A Connected Graph.\na connected graph contains a series of nodes and links which are\nrendered in a buffer, or serialized to disk.")

(defclass cogre-node (cogre-graph-element) ((position :initarg :position :initform [0 0] :type vector :custom (vector integer integer) :documentation "The X,Y [COL ROW] position as a vector for this node.\nThe Width/Height if this node is determined by RECTANGLE, which is\na list of strings representing the body of the node.") (blank-lines-top :allocation :class :initform 1 :documentation "Number of blank lines above the object-name.") (blank-lines-bottom :allocation :class :initform 1 :documentation "Number of blank lines below the last line of text.") (alignment :initform nil :type symbol :allocation :class :documentation "Alignment of text when displayed in the box.") (rectangle :initform nil :type list :documentation "A List of strings representing an Emacs rectangle.\nThis rectangle is used for inserting and moving the block of\ncharacters that represent this node in a buffer.\nThe rectangle is NOT SAVED.\nOther fields in the node are used to build a new RECTANGLE of strings\nat load time.")) "Connected Graph node.\nNodes are regions with a fill color, and some amount of text representing\na status, or values.")

(defclass cogre-link (cogre-graph-element) ((start :initarg :start :initform nil :type (or null string cogre-node) :documentation "The starting node.\nAs a string, the object-name of the node we start on.\nAs an object, the node we start on.") (end :initarg :end :initform nil :type (or null string cogre-node) :documentation "The ending node.\nAs a string, the object-name of the node we end on.\nAs an object, the node we end on.") (start-glyph :initform [nil nil nil nil] :allocation :class :type vector :documentation "The starting glyph.\nA Glyph can be NULL, meaning nothing, or a vector.\nA Vector must be 4 elements long.  This represents glyphs on\nthe [ TOP BOTTOM LEFT RIGHT ] of the attached node.\nEach element of the vector must be a list representing a rectangle.") (end-glyph :initform [nil nil nil nil] :allocation :class :type vector :documentation "The ending glyph.\nSee slot `start-glyph'") (horizontal-preference-ratio :initform 0.5 :allocation :class :documentation "When choosing a link's direction, a weight applied to horizontal.\nSince characters are not square, this ratio attempts to handle the visible\nspace the link spans, not the number of characters in the coordinate\nsystem being used.\nAlso, some links may want to be vertical or horizontal as often as\npossible, thus values of 0 or 10 are also fine to advance a\npreference.") (stop-position :initform nil :documentation "After drawing this link, store a place for a tab stop.") (layout-direction :initform (quote any) :documentation "When using the layout engine, the preferred direction this link points.\nThis can have a value of 'up, 'down, 'left, 'right, 'horizontal,\n'vertical, or 'any.")) "Connected Graph link.\nLinks are lines drawn between two nodes, or possibly loose in space\nas an intermediate step.  Some links have text describing what they\ndo, and most links have special markers on one end or another, such as\narrows or circles.")

(defclass cogre-arrow (cogre-link) ((end-glyph :initform [(" ^ " "/|\\") ("\\|/" " V ") ("<") (">")])) "This type of link is a simple arrow.")

(autoload (quote cogre) "cogre" "\
Create a new graph not associated with a buffer.
The new graph will be given NAME.  See `cogre-mode' for details.
Optional argument GRAPH-CLASS indicates the type of graph to create.

\(fn NAME &optional GRAPH-CLASS)" t nil)

;;;***

;;;### (autoloads (data-debug-new-buffer) "data-debug" "data-debug.el"
;;;;;;  (20979 61065))
;;; Generated autoloads from data-debug.el

(autoload (quote data-debug-new-buffer) "data-debug" "\
Create a new data-debug buffer with NAME.

\(fn NAME)" nil nil)

;;;***

;;;### (autoloads (global-ede-mode) "ede" "ede.el" (20824 29944))
;;; Generated autoloads from ede.el

(defvar global-ede-mode nil "\
Non-nil if Global-Ede mode is enabled.
See the command `global-ede-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-ede-mode'.")

(custom-autoload (quote global-ede-mode) "ede" nil)

(autoload (quote global-ede-mode) "ede" "\
Toggle global EDE (Emacs Development Environment) mode.
With a prefix argument ARG, enable global EDE mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil.

This global minor mode enables `ede-minor-mode' in all buffers in
an EDE controlled project.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (define-fame-channel) "fame" "fame.el" (20580 44388))
;;; Generated autoloads from fame.el

(autoload (quote define-fame-channel) "fame" "\
Define the new message channel CHANNEL.
CHANNEL must be a non-nil symbol.
The optional argument DEFAULT specifies the default value of message
levels for this channel.  By default it is the value of
`fame-default-level-values'.
DOCSTRING is an optional channel documentation.

This defines the option `CHANNEL-fame-levels' to customize the current
value of message levels.  And the functions `CHANNEL-send-debug',
`CHANNEL-send-info', `CHANNEL-send-warning', and `CHANNEL-send-error',
that respectively send debug, informational, warning, and error
messages to CHANNEL.

\(fn CHANNEL &optional DEFAULT DOCSTRING)" nil (quote macro))

;;;***

;;;### (autoloads (inversion-require-emacs) "inversion" "inversion.el"
;;;;;;  (20746 56154))
;;; Generated autoloads from inversion.el

(autoload (quote inversion-require-emacs) "inversion" "\
Declare that you need either EMACS-VER, XEMACS-VER or SXEMACS-ver.
Only checks one based on which kind of Emacs is being run.

\(fn EMACS-VER XEMACS-VER SXEMACS-VER)" nil nil)

;;;***

;;;### (autoloads nil "mode-local" "mode-local.el" (20981 1996))
;;; Generated autoloads from mode-local.el

(put (quote define-overloadable-function) (quote doc-string-elt) 3)

;;;***

;;;### (autoloads (pprint-function pprint pprint-to-string) "pprint"
;;;;;;  "pprint.el" (20580 44388))
;;; Generated autoloads from pprint.el

(autoload (quote pprint-to-string) "pprint" "\
Return a string containing the pretty-printed representation of OBJECT.
OBJECT can be any Lisp object.  Quoting characters are used as needed
to make output that `read' can handle, whenever this is possible.  The
pretty printer try as much as possible to limit the length of lines to
given WIDTH.  WIDTH value defaults to `fill-column'.

\(fn OBJECT &optional WIDTH)" nil nil)

(autoload (quote pprint) "pprint" "\
Output the pretty-printed representation of OBJECT, any Lisp object.
Quoting characters are printed as needed to make output that `read'
can handle, whenever this is possible.  Output stream is STREAM, or
value of `standard-output' (which see).  The pretty printer try as
much as possible to limit the length of lines to given WIDTH.  WIDTH
value defaults to `fill-column'.

\(fn OBJECT &optional STREAM WIDTH)" nil nil)

(autoload (quote pprint-function) "pprint" "\
See a pretty-printed representation of FUNCTION-NAME.

\(fn FUNCTION-NAME)" t nil)

;;;***

;;;### (autoloads (semantic-mode semantic-default-submodes) "semantic"
;;;;;;  "semantic.el" (20831 38598))
;;; Generated autoloads from semantic.el

(defvar semantic-default-submodes (quote (global-semantic-idle-scheduler-mode global-semanticdb-minor-mode)) "\
List of auxiliary Semantic minor modes enabled by `semantic-mode'.
The possible elements of this list include the following:

 `global-semanticdb-minor-mode'        - Maintain tag database.
 `global-semantic-idle-scheduler-mode' - Reparse buffer when idle.
 `global-semantic-idle-summary-mode'   - Show summary of tag at point.
 `global-semantic-idle-completions-mode' - Show completions when idle.
 `global-semantic-decoration-mode'     - Additional tag decorations.
 `global-semantic-highlight-func-mode' - Highlight the current tag.
 `global-semantic-stickyfunc-mode'     - Show current fun in header line.
 `global-semantic-mru-bookmark-mode'   - Provide `switch-to-buffer'-like
                                         keybinding for tag names.
 `global-cedet-m3-minor-mode'          - A mouse 3 context menu.
 `global-semantic-idle-local-symbol-highlight-mode' - Highlight references
                                         of the symbol under point.
The following modes are more targeted at people who want to see
 some internal information of the semantic parser in action:
 `global-semantic-highlight-edits-mode' - Visualize incremental parser by
                                         highlighting not-yet parsed changes.
 `global-semantic-show-unmatched-syntax-mode' - Highlight unmatched lexical
                                         syntax tokens.
 `global-semantic-show-parser-state-mode' - Display the parser cache state.")

(custom-autoload (quote semantic-default-submodes) "semantic" t)

(defvar semantic-mode nil "\
Non-nil if Semantic mode is enabled.
See the command `semantic-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `semantic-mode'.")

(custom-autoload (quote semantic-mode) "semantic" nil)

(autoload (quote semantic-mode) "semantic" "\
Toggle parser features (Semantic mode).
With a prefix argument ARG, enable Semantic mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
Semantic mode if ARG is omitted or nil.

In Semantic mode, Emacs parses the buffers you visit for their
semantic content.  This information is used by a variety of
auxiliary minor modes, listed in `semantic-default-submodes';
all the minor modes in this list are also enabled when you enable
Semantic mode.

\\{semantic-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("cedet-compat.el" "cedet-cscope.el" "cedet-files.el"
;;;;;;  "cedet-idutils.el" "cedet.el" "pulse.el" "srecode.el" "working.el")
;;;;;;  (21169 32245 343519))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; loaddefs.el ends here

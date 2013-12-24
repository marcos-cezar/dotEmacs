;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (cogre-export-ascii) "ascii" "ascii.el" (20580
;;;;;;  44388))
;;; Generated autoloads from ascii.el

(autoload (quote cogre-export-ascii) "ascii" "\
Export the current diagram into an ASCII buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads (cogre-export-dot-postscript-print cogre-export-dot-png
;;;;;;  cogre-export-dot) "convert" "convert.el" (20605 46656))
;;; Generated autoloads from convert.el

(autoload (quote cogre-export-dot) "convert" "\
Export the current COGRE graph to DOT notation.
DOT is a part of GraphViz.

\(fn)" t nil)

(autoload (quote cogre-export-dot-png) "convert" "\
Export the current COGRE graph to DOT, then convert that to PNG.
The png file is then displayed in an Emacs buffer.
DOT is a part of GraphVis.

\(fn)" t nil)

(autoload (quote cogre-export-dot-postscript-print) "convert" "\
Print the current graph.
This is done by exporting the current COGRE graph to DOT, then
convert that to Postscript before printing.
DOT is a part of GraphVis.

\(fn)" t nil)

;;;***

;;;### (autoloads (cogre-dot-mode) "dot-mode" "dot-mode.el" (20580
;;;;;;  44388))
;;; Generated autoloads from dot-mode.el

(autoload (quote cogre-dot-mode) "dot-mode" "\
Major mode for the dot language.
This is a mini-mode that will first attempt to load and install
`graphviz-dot-mode' in this buffer.  If that fails, it installs
the syntax table, and runs a hook needed to get Semantic working
as a parsing engine.

\(fn)" t nil)

(add-to-list (quote auto-mode-alist) (quote ("\\.dot\\'" . cogre-dot-mode)))

;;;***

;;;### (autoloads (cogre-layout) "layout" "layout.el" (20779 52264))
;;; Generated autoloads from layout.el

(autoload (quote cogre-layout) "layout" "\
Layout the current graph.
This function depends on graphviz `dot' program.

\(fn)" t nil)

;;;***

;;;### (autoloads (cogre-mode) "mode" "mode.el" (20981 1996))
;;; Generated autoloads from mode.el

(autoload (quote cogre-mode) "mode" "\
Connected Graph Editor Mode.
\\{cogre-mode-map}

\(fn)" t nil)

(add-to-list (quote auto-mode-alist) (cons "\\.cgr\\'" (quote cogre-mode)))

;;;***

;;;### (autoloads (cogre-periodic) "periodic" "periodic.el" (20580
;;;;;;  44388))
;;; Generated autoloads from periodic.el

(autoload (quote cogre-periodic) "periodic" "\
Create a periodic table of COGRE objects.

\(fn)" t nil)

;;;***

;;;### (autoloads (cogre-picture-insert-rectangle) "picture-hack"
;;;;;;  "picture-hack.el" (20580 44388))
;;; Generated autoloads from picture-hack.el

(autoload (quote cogre-picture-insert-rectangle) "picture-hack" "\
Overlay RECTANGLE with upper left corner at point.
Leaves the region surrounding the rectangle.

\(fn RECTANGLE)" nil nil)

;;;***

;;;### (autoloads (cogre-uml-quick-class cogre-export-code cogre-semantic-tag-to-node)
;;;;;;  "semantic" "semantic.el" (20981 1996))
;;; Generated autoloads from semantic.el

(autoload (quote cogre-semantic-tag-to-node) "semantic" "\
Convert the Semantic tag TAG into a COGRE node.
Only handles data types nodes.
To convert function/variables into methods or attributes in
an existing COGRE node, see @TODO - do that.

\(fn TAG)" nil nil)

(autoload (quote cogre-export-code) "semantic" "\
Export the current graph into source-code in FILE.
Uses `cogre-export-semantic' to convert into Semantic tags.
Uses `cogre-srecode-setup' to setup SRecode for code generation.

\(fn FILE)" t nil)

(autoload (quote cogre-uml-quick-class) "semantic" "\
Create a new UML diagram based on CLASS showing only immediate lineage.
The parent to CLASS, CLASS, and all of CLASSes children will be shown.

\(fn CLASS)" t nil)

;;;***

;;;### (autoloads (srecode-semantic-handle-:dot srecode-semantic-handle-:cogre
;;;;;;  cogre-srecode-setup) "srecode" "srecode.el" (20580 44388))
;;; Generated autoloads from srecode.el

(autoload (quote cogre-srecode-setup) "srecode" "\
Update various paths to get SRecode to identify COGRE macros.

\(fn)" nil nil)

(autoload (quote srecode-semantic-handle-:cogre) "srecode" "\
Add macros to dictionary DICT based on COGRE data.

\(fn DICT)" nil nil)

(eval-after-load "srecode-map" (quote (cogre-srecode-setup)))

(autoload (quote srecode-semantic-handle-:dot) "srecode" "\
Add macros to dictionary DICT based on the current DOT buffer.

\(fn DICT)" nil nil)

;;;***

;;;### (autoloads (cogre-uml-sort-for-lineage cogre-uml-enable-unicode)
;;;;;;  "uml" "uml.el" (20981 1996))
;;; Generated autoloads from uml.el

(autoload (quote cogre-uml-enable-unicode) "uml" "\
Enable use of UNICODE symbols to create COGRE graphs.
Inheritance uses math triangle on page 25a0.
Aggregation uses math square on edge 25a0.
Line-drawing uses line-drawing codes on page 2500.
See http://unicode.org/charts/symbols.html.

The unicode symbols can be differing widths.  This will make the
cogre chart a little screwy somteims.  Your mileage may vary.

\(fn)" t nil)

(autoload (quote cogre-uml-sort-for-lineage) "uml" "\
Sort the current graph G for determining inheritance lineage.
Return it as a list of lists.  Each entry is of the form:
  ( NODE PARENT1 PARENT2 ... PARENTN)

\(fn G)" t nil)

;;;***

;;;### (autoloads (wisent-dot-setup-parser) "wisent-dot" "wisent-dot.el"
;;;;;;  (20580 44388))
;;; Generated autoloads from wisent-dot.el

(autoload (quote wisent-dot-setup-parser) "wisent-dot" "\
Setup buffer for parse.

\(fn)" nil nil)

(add-hook (quote graphviz-dot-mode-hook) (quote wisent-dot-setup-parser))

(add-hook (quote cogre-dot-mode-hook) (quote wisent-dot-setup-parser))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; loaddefs.el ends here

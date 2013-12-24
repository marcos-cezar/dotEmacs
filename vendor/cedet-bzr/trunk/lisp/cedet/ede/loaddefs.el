;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ede-android-load) "android" "android.el" (20755
;;;;;;  2728))
;;; Generated autoloads from android.el

(autoload (quote ede-android-load) "android" "\
Return an Android Project object if there is a match.
Return nil if there isn't one.
Argument DIR is the directory it is created for.
ROOTPROJ is nil, since there is only one project.

\(fn DIR &optional ROOTPROJ)" nil nil)

(ede-add-project-autoload (ede-project-autoload "android" :name "ANDROID ROOT" :file (quote ede/android) :proj-file "AndroidManifest.xml" :load-type (quote ede-android-load) :class-sym (quote ede-android-project) :new-p t :safe-p t))

(defclass ede-android-project (ede-project eieio-instance-tracker) ((tracking-symbol :initform (quote ede-android-project-list)) (keybindings :initform (("S" . ede-android-visit-strings) ("U" . ede-android-install))) (menu :initform (["Upload/Install to Device" ede-android-install] ["Start Debug Proxy (DDMS)" cedet-android-start-ddms] "---" ["Visit strings.xml" ede-android-visit-strings] ["Edit Projectfile" ede-edit-file-target (ede-buffer-belongs-to-project-p)] "--" ["Update Version" ede-update-version ede-object] ["Version Control Status" ede-vc-project-directory ede-object] ["Android Shell" cedet-android-adb-shell ede-object] ["Layout Optimizer" ede-android-layoutopt ede-object] "--" ["Rescan Project Files" ede-rescan-toplevel t])) (package :initarg :package :initform "com" :type string :documentation "The package extracted from the Manifest.")) "Project for Android applications.")

;;;***

;;;### (autoloads (ede-ant-load ede-ant-project-root) "ant" "ant.el"
;;;;;;  (20755 2728))
;;; Generated autoloads from ant.el

(defconst ede-ant-project-file-name "build.xml" "\
name of project file for Ant projects")

(autoload (quote ede-ant-project-root) "ant" "\
Get the Ant root directory for DIR.

\(fn &optional DIR)" nil nil)

(autoload (quote ede-ant-load) "ant" "\
Return a Leiningen Project object if there is a match.
Return nil if there isn't one.
Argument DIR is the directory it is created for.
ROOTPROJ is nil, since there is only one project.

\(fn DIR &optional ROOTPROJ)" nil nil)

(defclass ede-ant-project (ede-jvm-base-project eieio-instance-tracker) ((tracking-symbol :initform (quote ede-ant-project-list)) (srcroot :initarg :srcroot :initform nil :type list :documentation "A list of roots of the java sources in this project.\nEach directory is relative to the directory that :file is in.\nThis directory is used as part of the class path when searching for\nsymbols within this project.\nUse this if the root of your project is not the same as the root of\nyour java sources.") (localclasspath :initarg :localclasspath :initform nil :type list :documentation "The default classpath used within a project of relative path names.\nAll files listed in the local class path are relative to this project's root.\nThis classpath is prepended to CLASSPATH when searching for symbols.\nThe current project's java source root is always search before this\nclasspath.")) "EDE Ant project class." :method-invocation-order :depth-first)

(ede-add-project-autoload (ede-project-autoload "ant" :name "Ant" :file (quote ede/ant) :proj-file ede-ant-project-file-name :proj-root (quote ede-ant-project-root) :load-type (quote ede-ant-load) :class-sym (quote ede-ant-project) :new-p nil :safe-p t) (quote generic))

;;;***

;;;### (autoloads (ede-arduino-load ede-arduino-file ede-arduino-root)
;;;;;;  "arduino" "arduino.el" (20981 34394))
;;; Generated autoloads from arduino.el

(autoload (quote ede-arduino-root) "arduino" "\
Get the root project directory for DIR.
The only arduino sketches allowed are those configured by the arduino IDE
in their sketch directory.

If BASEFILE is non-nil, then convert root to the project basename also.

Consider expanding this at some later date.

\(fn &optional DIR BASEFILE)" nil nil)

(autoload (quote ede-arduino-file) "arduino" "\
Get a file representing the root of this arduino project.
It is a file ending in .pde or .ino that has the same basename as
the directory it is in.  Optional argument DIR is the directory
to check.

\(fn &optional DIR)" nil nil)

(autoload (quote ede-arduino-load) "arduino" "\
Return an Arduino project object if there is one.
Return nil if there isn't one.
Argument DIR is the directory it is created for.
ROOTPROJ is nil, sinc there is only one project for a directory tree.

\(fn DIR &optional ROOTPROJ)" nil nil)

(add-to-list (quote ede-project-class-files) (ede-project-autoload "arduino" :name "ARDUINO SKETCH" :file (quote ede/arduino) :proj-root-dirmatch (ede-project-autoload-dirmatch "arduino" :fromconfig "~/.arduino/preferences.txt" :configregex "^sketchbook.path=\\([^\n]+\\)$" :configregexidx 1) :proj-file (quote ede-arduino-file) :proj-root (quote ede-arduino-root) :load-type (quote ede-arduino-load) :class-sym (quote ede-arduino-project) :safe-p t :new-p t) t)

;;;***

;;;### (autoloads (ede-cpp-root-project-root) "cpp-root" "cpp-root.el"
;;;;;;  (20908 48525))
;;; Generated autoloads from cpp-root.el

(autoload (quote ede-cpp-root-project-root) "cpp-root" "\
Get the root directory for DIR.

\(fn &optional DIR)" nil nil)

(ede-add-project-autoload (ede-project-autoload "cpp-root" :name "CPP ROOT" :file (quote ede/cpp-root) :proj-file (quote ede-cpp-root-project-file-for-dir) :proj-root (quote ede-cpp-root-project-root) :load-type (quote ede-cpp-root-load) :class-sym (quote ede-cpp-root-project) :new-p nil :safe-p t) (quote unique))

(defclass ede-cpp-root-project (ede-project eieio-instance-tracker) ((tracking-symbol :initform (quote ede-cpp-root-project-list)) (include-path :initarg :include-path :initform (quote ("/include" "../include/")) :type list :documentation "The default locate function expands filenames within a project.\nIf a header file (.h, .hh, etc) name is expanded, and\nthe :locate-fcn slot is nil, then the include path is checked\nfirst, and other directories are ignored.  For very large\nprojects, this optimization can save a lot of time.\n\nDirectory names in the path can be relative to the current\nbuffer's `default-directory' (not starting with a /).  Directories\nthat are relative to the project's root should start with a /, such\nas  \"/include\", meaning the directory `include' off the project root\ndirectory.") (system-include-path :initarg :system-include-path :initform nil :type list :documentation "The system include path for files in this project.\nC files initialized in an ede-cpp-root-project have their semantic\nsystem include path set to this value.  If this is nil, then the\nsemantic path is not modified.") (spp-table :initarg :spp-table :initform nil :type list :documentation "C Preprocessor macros for your files.\nPreprocessor symbols will be used while parsing your files.\nThese macros might be passed in through the command line compiler, or\nare critical symbols derived from header files.  Providing header files\nmacro values through this slot improves accuracy and performance.\nUse `:spp-files' to use these files directly.") (spp-files :initarg :spp-files :initform nil :type list :documentation "C header file with Preprocessor macros for your files.\nThe PreProcessor symbols appearing in these files will be used while\nparsing files in this project.\nSee `semantic-lex-c-preprocessor-symbol-map' for more on how this works.") (header-match-regexp :initarg :header-match-regexp :initform "\\.\\(h\\(h\\|xx\\|pp\\|\\+\\+\\)?\\|H\\)$\\|\\<\\w+$" :type string :documentation "Regexp used to identify C/C++ header files.") (locate-fcn :initarg :locate-fcn :initform nil :type (or null function) :documentation "The locate function can be used in place of\n`ede-expand-filename' so you can quickly customize your custom target\nto use specialized local routines instead of the EDE routines.\nThe function symbol must take two arguments:\n  NAME - The name of the file to find.\n  DIR - The directory root for this cpp-root project.\n\nIt should return the fully qualified file name passed in from NAME.  If that file does not\nexist, it should return nil.") (compile-command :initarg :compile-command :initform nil :type (or null string function) :documentation "Compilation command that will be used for this project.\nIt could be string or function that will accept proj argument and should return string.\nThe string will be passed to 'compile' function that will be issued in root\ndirectory of project.")) "EDE cpp-root project class.\nEach directory needs a project file to control it.")

;;;***

;;;### (autoloads (ede-project-sort-targets ede-customize-current-target
;;;;;;  ede-customize-project) "custom" "custom.el" (20746 56154))
;;; Generated autoloads from custom.el

(autoload (quote ede-customize-project) "custom" "\
Edit fields of the current project through EIEIO & Custom.

\(fn)" t nil)

(defalias (quote customize-project) (quote ede-customize-project))

(autoload (quote ede-customize-current-target) "custom" "\
Edit fields of the current target through EIEIO & Custom.

\(fn)" t nil)

(defalias (quote customize-target) (quote ede-customize-current-target))

(autoload (quote ede-project-sort-targets) "custom" "\
Create a custom-like buffer for sorting targets of current project.

\(fn)" t nil)

;;;***

;;;### (autoloads (ede-emacs-project-root) "emacs" "emacs.el" (20746
;;;;;;  56154))
;;; Generated autoloads from emacs.el

(autoload (quote ede-emacs-project-root) "emacs" "\
Get the root directory for DIR.

\(fn &optional DIR)" nil nil)

(ede-add-project-autoload (ede-project-autoload "emacs" :name "EMACS ROOT" :file (quote ede/emacs) :proj-file "src/emacs.c" :proj-root-dirmatch "emacs[^/]*" :proj-root (quote ede-emacs-project-root) :load-type (quote ede-emacs-load) :class-sym (quote ede-emacs-project) :new-p nil :safe-p t) (quote unique))

;;;***

;;;### (autoloads (ede-find-file) "files" "files.el" (20746 56154))
;;; Generated autoloads from files.el

(autoload (quote ede-find-file) "files" "\
Find FILE in project.  FILE can be specified without a directory.
There is no completion at the prompt.  FILE is searched for within
the current EDE project.

\(fn FILE)" t nil)

;;;***

;;;### (autoloads (ede-enable-generic-projects) "generic" "generic.el"
;;;;;;  (21128 41578))
;;; Generated autoloads from generic.el

(autoload (quote ede-enable-generic-projects) "generic" "\
Enable generic project loaders.

\(fn)" t nil)

;;;***

;;;### (autoloads (ede-java-root-project-root) "java-root" "java-root.el"
;;;;;;  (20687 4800))
;;; Generated autoloads from java-root.el

(autoload (quote ede-java-root-project-root) "java-root" "\
Get the root directory for DIR.

\(fn &optional DIR)" nil nil)

(ede-add-project-autoload (ede-project-autoload "java-root" :name "JAVA ROOT" :file (quote ede-java-root) :proj-file (quote ede-java-root-project-file-for-dir) :proj-root (quote ede-java-root-project-root) :load-type (quote ede-java-root-load) :class-sym (quote ede-java-root) :new-p nil :safe-p t) (quote unique))

(defclass ede-java-root-project (ede-jvm-base-project eieio-instance-tracker) ((tracking-symbol :initform (quote ede-java-root-project-list)) (srcroot :initarg :srcroot :initform nil :type list :documentation "A list of roots of the java sources in this project.\nEach directory is relative to the directory that :file is in.\nThis directory is used as part of the class path when searching for\nsymbols within this project.\nUse this if the root of your project is not the same as the root of\nyour java sources.") (localclasspath :initarg :localclasspath :initform nil :type list :documentation "The default classpath used within a project of relative path names.\nAll files listed in the local class path are relative to this project's root.\nThis classpath is prepended to CLASSPATH when searching for symbols.\nThe current project's java source root is always search before this\nclasspath.") (locate-fcn :initarg :locate-fcn :initform nil :type (or null function) :documentation "The locate function can be used in place of\n`ede-expand-filename' so you can quickly customize your custom target\nto use specialized local routines instead of the EDE routines.\nThe function symbol must take two arguments:\n  NAME - The name of the file to find.\n  DIR - The directory root for this java-root project.\n\nIt should return the fully qualified file name passed in from NAME.  If that file does not\nexist, it should return nil.")) "EDE java-root project class.\nEach directory needs a project file to control it.")

;;;***

;;;### (autoloads nil "jvm-base" "jvm-base.el" (20672 24222))
;;; Generated autoloads from jvm-base.el

(defclass ede-jvm-base-project (ede-project) ((classpath :initform nil :initarg :classpath :type list :documentation "Classpath that is either detected automatically, or set by user, depending\non project's type.") (file-mod-time :initform 0) (current-target :initform "" :initarg :current-target :type string) (target-options :initform nil :initarg :target-options :type list) (existing-targets :initform nil :initarg :existing-targets :type list)) "Base project class for JVM-base projects." :method-invocation-order :depth-first)

;;;***

;;;### (autoloads (ede-lein2-load ede-lein2-project-root) "lein2"
;;;;;;  "lein2.el" (20755 2728))
;;; Generated autoloads from lein2.el

(defconst ede-lein2-project-file-name "project.clj" "\
name of project file for Lein2 projects")

(autoload (quote ede-lein2-project-root) "lein2" "\
Get the Lein2 root directory for DIR.

\(fn &optional DIR)" nil nil)

(autoload (quote ede-lein2-load) "lein2" "\
Return a Leiningen Project object if there is a match.
Return nil if there isn't one.
Argument DIR is the directory it is created for.
ROOTPROJ is nil, since there is only one project.

\(fn DIR &optional ROOTPROJ)" nil nil)

(defclass ede-lein2-project (ede-jvm-base-project eieio-instance-tracker) ((tracking-symbol :initform (quote ede-lein2-project-list))) "EDE Leiningen2 project class." :method-invocation-order :depth-first)

(ede-add-project-autoload (ede-project-autoload "lein2" :name "Lein2" :file (quote ede/lein2) :proj-file ede-lein2-project-file-name :proj-root (quote ede-lein2-project-root) :load-type (quote ede-lein2-load) :class-sym (quote ede-lein2-project) :new-p nil :safe-p t) (quote generic))

;;;***

;;;### (autoloads (ede-linux-load ede-linux-project-root) "linux"
;;;;;;  "linux.el" (21090 27969))
;;; Generated autoloads from linux.el

(autoload (quote ede-linux-project-root) "linux" "\
Get the root directory for DIR.

\(fn &optional DIR)" nil nil)

(autoload (quote ede-linux-load) "linux" "\
Return an Linux Project object if there is a match.
Return nil if there isn't one.
Argument DIR is the directory it is created for.
ROOTPROJ is nil, since there is only one project.

\(fn DIR &optional ROOTPROJ)" nil nil)

(ede-add-project-autoload (ede-project-autoload "linux" :name "LINUX ROOT" :file (quote ede/linux) :proj-file "scripts/ver_linux" :proj-root-dirmatch "linux[^/]*" :proj-root (quote ede-linux-project-root) :load-type (quote ede-linux-load) :class-sym (quote ede-linux-project) :new-p nil :safe-p t) (quote unique))

;;;***

;;;### (autoloads (ede-enable-locate-on-project) "locate" "locate.el"
;;;;;;  (20981 1996))
;;; Generated autoloads from locate.el

(autoload (quote ede-enable-locate-on-project) "locate" "\
Enable an EDE locate feature on PROJECT.
Attempt to guess which project locate style to use
based on `ede-locate-setup-options'.

\(fn &optional PROJECT)" t nil)

;;;***

;;;### (autoloads (ede-m3-install) "m3" "m3.el" (20580 44388))
;;; Generated autoloads from m3.el

(autoload (quote ede-m3-install) "m3" "\
Not documented

\(fn)" nil nil)

;;;***

;;;### (autoloads (ede-make-check-version) "make" "make.el" (20981
;;;;;;  1996))
;;; Generated autoloads from make.el

(autoload (quote ede-make-check-version) "make" "\
Check the version of GNU Make installed.
The check passes if the MAKE version is no high enough, or if it
is not GNU make.
If NOERROR is non-nil, return t for success, nil for failure.
If NOERROR is nil, then throw an error on failure.  Return t otherwise.

\(fn &optional NOERROR)" t nil)

;;;***

;;;### (autoloads (ede-maven2-load ede-maven2-project-root) "maven2"
;;;;;;  "maven2.el" (20755 2728))
;;; Generated autoloads from maven2.el

(autoload (quote ede-maven2-project-root) "maven2" "\
Get the root directory for DIR.

\(fn &optional DIR)" nil nil)

(autoload (quote ede-maven2-load) "maven2" "\
Return a Maven Project object if there is a match.
Return nil if there isn't one.
Argument DIR is the directory it is created for.
ROOTPROJ is nil, since there is only one project.

\(fn DIR &optional ROOTPROJ)" nil nil)

(defclass ede-maven2-project (ede-jvm-base-project eieio-instance-tracker) ((tracking-symbol :initform (quote ede-maven2-project-list)) (file-header-line :initform ";; EDE Maven2 project wrapper") (pom :initform nil :initarg :pom :documentation "Parsed pom.xml file")) "Project Type for Maven2 based Java projects." :method-invocation-order :depth-first)

(ede-add-project-autoload (ede-project-autoload "maven2" :name "MAVEN2" :file (quote ede/maven2) :proj-file "pom.xml" :proj-root (quote ede-maven2-project-root) :load-type (quote ede-maven2-load) :class-sym (quote ede-maven2-project) :new-p nil :safe-p t) (quote generic))

;;;***

;;;### (autoloads (ede-speedbar-file-setup) "speedbar" "speedbar.el"
;;;;;;  (20908 48525))
;;; Generated autoloads from speedbar.el

(autoload (quote ede-speedbar-file-setup) "speedbar" "\
Setup some keybindings in the Speedbar File display.

\(fn)" nil nil)

;;;***

;;;### (autoloads (ede-vc-project-directory ede-upload-html-documentation
;;;;;;  ede-upload-distribution ede-edit-web-page ede-web-browse-home)
;;;;;;  "system" "system.el" (20746 56154))
;;; Generated autoloads from system.el

(autoload (quote ede-web-browse-home) "system" "\
Browse the home page of the current project.

\(fn)" t nil)

(autoload (quote ede-edit-web-page) "system" "\
Edit the web site for this project.

\(fn)" t nil)

(autoload (quote ede-upload-distribution) "system" "\
Upload the current distribution to the correct location.
Use /user@ftp.site.com: file names for FTP sites.
Download tramp, and use /r:machine: for names on remote sites w/out FTP access.

\(fn)" t nil)

(autoload (quote ede-upload-html-documentation) "system" "\
Upload the current distributions documentation as HTML.
Use /user@ftp.site.com: file names for FTP sites.
Download tramp, and use /r:machine: for names on remote sites w/out FTP access.

\(fn)" t nil)

(autoload (quote ede-vc-project-directory) "system" "\
Run `vc-dir' on the current project.

\(fn)" t nil)

;;;***

;;;### (autoloads (ede-update-version) "util" "util.el" (20779 52264))
;;; Generated autoloads from util.el

(autoload (quote ede-update-version) "util" "\
Update the current projects main version number.
Argument NEWVERSION is the version number to use in the current project.

\(fn NEWVERSION)" t nil)

;;;***

;;;### (autoloads nil nil ("auto.el" "autoconf-edit.el" "base.el"
;;;;;;  "dired.el" "makefile-edit.el" "pconf.el" "pmake.el" "proj-archive.el"
;;;;;;  "proj-aux.el" "proj-comp.el" "proj-elisp.el" "proj-info.el"
;;;;;;  "proj-misc.el" "proj-obj.el" "proj-prog.el" "proj-scheme.el"
;;;;;;  "proj-shared.el" "proj.el" "project-am.el" "shell.el" "source.el"
;;;;;;  "srecode.el") (21169 32247 218803))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; loaddefs.el ends here


(defsystem area51
  :version "0.1.0"
  :author "TANI Kojiro, Francis St-Amour, Mark Stahl"
  :license "GPLv3"
  :depends-on (
    #:uiop
    #:cl-ppcre
    #:cl-readline
    #:magic-ed
    #:uiop)
  :serial t
  :components (
    (:module "src"
      :components (
        (:file "package")
        (:file "util")
        (:file "color")
        (:file "color-constants")
        (:file "color-scheme")
        (:file "highlight")
        (:file "keymap")
        (:file "pager")
        (:file "command")
        (:file "commands")
        (:file "completer")
        (:file "repl")
        (:file "main"))))
  :description "A full-featured repl implementation."
  :long-description "A full-featured repl implementation.")


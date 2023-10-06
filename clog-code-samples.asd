(asdf:defsystem #:clog-code-samples
  :description "New CLOG System"
  :author "some@one.com"
  :license  "BSD"
  :version "0.0.0"
  :serial t
  :entry-point "clog-code-samples:start-app"
  :depends-on (#:clog ) ; add clog plugins here as #:plugin for run time
  :components (
               (:file "clog-code-samples")
               (:file "00-clog-routes")
               (:file "01-drag-drop")
               ))

(asdf:defsystem #:clog-code-samples/tools
  :defsystem-depends-on (:clog)
  :depends-on (#:clog-code-samples #:clog/tools) ; add clog plugins here as #:plugin/tools for design time
  :components ())

;;;; clock.asd

(asdf:defsystem #:clock
  :serial t
  :description "General purpose date and time library"
  :author "Daniel Lowe <dlowe@dlowe.net>"
  :license "Specify license here"
  :components 
  ((:module "src"
            :serial t
            :components ((:file "package")
                         (:file "date")
                         (:file "datetime")
                         (:file "time")
                         (:file "timestamp")
                         (:file "timezone")))))

(defmethod perform ((op test-op) (system (eql (find-system :clock))))
  (asdf:load-system :clock.test)
  (eval (read-from-string "(stefil:funcall-test-with-feedback-message 'clock.test::test)")))

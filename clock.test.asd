(cl:defsystem :clock.test
  :name "clock.test"
  :author "Daniel Lowe <dlowe@dlowe.net>"
  :description "Testing code for the clock library"
  :depends-on (:stefil
               :clock)
  :components ((:module "test"
                :serial t
                :components ((:file "package")))))


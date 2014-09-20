(cl:defpackage #:clock.test
  (:use #:alexandria
        #:common-lisp
        #:stefil
        #:clock))

(in-package :clock.test)

(defsuite* (test :in root-suite) ()
  (run-child-tests))

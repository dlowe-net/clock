(in-package #:clock)

;; A subzone is an offset from UTC of a datetime. (e.g. EDT CET)
(defclass subzone ()
  (name offset))

;; A timezone is a collection of subzones which may be activated
;; according to the date and time.
(defclass timezone ()
  (subzones))

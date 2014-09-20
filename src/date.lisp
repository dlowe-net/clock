(in-package #:clock)

;; A date is a decoded form denoting a particular day.  DATE is the
;; base class for dates of all kinds.
(defclass date ())

(defclass gregorian-date (date) ; maps dates to year, month, day following gregorian system
  (year month day)
  (:documentation "Representation of a date in the Gregorian calendar.
  This date class will be used more than any other, and is the date
  used by the standard-datetime class."))

(defclass julian-date (date) ; maps dates to year, month, day following julian system
  (year month day))

(defclass astronomical-date (date) ; maps dates to single category julian days
  (day))

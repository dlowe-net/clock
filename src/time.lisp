(in-package #:clock)

;; A time is a mapping of seconds from the start of the day to a
;; number of parts.
(defclass time ())

(defclass standard-time (time)       ; maps times to hour, minute, second, fractional seconds and a subzone, which defines an offset from UTC.
    (hour min sec fsec subzone)
  (:documentation "Representation of a time of day in the standard
  format of hours, minutes, and seconds.  The subzone is for
  formatting and converting to a timestamp, but may be NIL."))

(defclass decimal-time (time))         ; maps times to decimal hour, minute, second, fractional seconds

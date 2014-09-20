(in-package #:clock)

(defclass timestamp ()
  (days secs fsecs)
  (:documentation "A timestamp is a cut on the continuous axis of
  time.  DAYS is the number of days since March 1, 2000, and may be
  negative.  SECS is the number of seconds since midnight of that day.
  FSECS is a REAL number in the interval [0,1) representing the
  fractional seconds."))

(defun now ()
  "Returns a timestamp representing the current time.")

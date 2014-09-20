(in-package #:clock)

(defclass datetime ()
  ((date :accessor date-of :initarg :date)
   (time :accessor time-of :initarg :time)))

(defclass standard-datetime (datetime))

(defmethod initialize-instance :after ((dt standard-datetime) &rest initargs)
  "Initialze a standard-datetime with a gregorian date and standard time, and initialize those with "
  (destructuring-bind (arg-year arg-month arg-day arg-hour arg-minute arg-second arg-nsec)
      initargs
    (unless (slot-boundp dt date)
      (setf (date-of dt) (make-instance 'gregorian-date)))
    (unless (slot-boundp dt time)
      (setf (time-of dt) (make-instance 'standard-time)))
    (with-slots (year month day) (date-of dt)
      (with-slots (hour min sec fsec)
          (when arg-year (setf year arg-year))
          (when arg-month (setf month arg-month))
          (when arg-day (setf day arg-day))
          (when arg-hour (setf hour arg-hour))
          (when arg-min (setf min arg-min))
          (when arg-sec (setf sec arg-sec))))))

(defgeneric timestamp-to-datetime (timestamp datetime)
  (:documentation "Decodes a timestamp into the given datetime, and returns the datetime."))

(defgeneric datetime-to-timestamp (datetime)
  (:documentation  "Returns a timestamp represented by the datetime.  The datetime must not have any NIL fields."))

(defgeneric format-datetime (datetime stream format)
  (:documentation "Outputs the DATETIME onto STREAM in a format
  defined by FORMAT.  If STREAM is T, outputs onto *standard-output*.
  If STREAM is NIL, returns a string instead of NIL."))

(defgeneric parse-datetime (stream format datetime)
  (:documentation "Reads from STREAM a datetime formatted according to
  FORMAT, and places the result in DATETIME, which is also
  returned."))

(in-package #:euler)

(defun p16/solution ()
  (apply #'+ (mapcar #'digit-char-p
                     (loop for c across (format nil "~D" (expt 2 1000))
                           collect c))))

(in-package #:euler)

(defun p20/solution ()
  (apply #'+ (mapcar #'digit-char-p
                     (loop for c across (format nil "~D" (alexandria:factorial 100))
                           collect c))))

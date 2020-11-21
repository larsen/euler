(in-package #:euler)

(defun p6/solution ()
  (loop for n from 1 to 100
        sum n into sum-numbers
        sum (* n n) into sum-of-squares
        finally (return (abs (- sum-of-squares
                                (* sum-numbers sum-numbers))))))

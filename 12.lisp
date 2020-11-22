(in-package #:euler)

(defun triangle (n)
  (/ (* n (+ n 1)) 2))

(defun p12/solution ()
  (loop for n integer from 1
        when (> (length (divisors (triangle n))) 500)
          return (triangle n)))

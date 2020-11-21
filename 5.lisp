(in-package #:euler)

(defun is-divisible-up-to? (number n)
  (loop for i from 2 to n
        when (not (zerop (rem number i)))
          return nil
        finally (return t)))

(defun p5/solution ()
  (loop for i from 2
        when (is-divisible-up-to? i 20)
          return i))

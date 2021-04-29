(in-package #:euler)

(defun all-rotations-are-primes (n)
  (loop for r in (rotations n)
        always (is-prime? r)))

(defun p35/solution ()
  (count-if #'all-rotations-are-primes (range 1 999999)))

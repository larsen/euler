(in-package #:euler)

(defun p10/solution ()
  (apply #'+ (primes-below 2e6)))

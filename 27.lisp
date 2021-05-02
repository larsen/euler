(in-package #:euler)

(defun euler-primes-generator (a b)
  (loop for n from 0
        for p = (+ (expt n 2)
                   (* a n)
                   b)
        while (and (> p 0)
                   (is-prime? p))
        collect p))

(defun p27/solution ()
  (let ((max-generators)
        (max-prime-sequence-length 0))
    (loop for a from -999 to 999
          do (loop for b from -1000 to 1000
                   for prime-sequence = (euler-primes-generator a b)
                   do (if (> (length prime-sequence)
                             max-prime-sequence-length)
                          (progn
                            (setf max-generators (cons a b))
                            (setf max-prime-sequence-length (length prime-sequence)))))
          finally (return (* (car max-generators)
                             (cdr max-generators))))))

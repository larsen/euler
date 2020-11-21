(in-package #:euler)

(defun p14/solution ()
  (car (first (sort (loop for n from 1 to (- 1e6 1)
                          collect (cons n (length (collatz n))))
                    #'>= :key #'cdr))))

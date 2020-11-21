(in-package #:euler)

(defun palindrome-list ()
  (loop for f1 from 100 to 999
        append (loop for f2 from 100 to 999
                 when (is-palindrome-number? (* f1 f2))
                   collect (* f1 f2))))

(defun p4/solution ()
  (apply #'max (palindrome-list)))

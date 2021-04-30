(in-package #:euler)

(defun p36/solution ()
  (loop for n below 10e5
        when (and (is-palindrome-number? n)
                  (is-palindrome-number? n :base 2))
          sum n into total
        finally (return total)))

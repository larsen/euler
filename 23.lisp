(in-package #:euler)

(defun is-sum-of-abundant-numbers (n)
  (loop for a1 from 1 below n
        for a2 = (- n a1)
        when (and (is-abundant? a1)
                  (is-abundant? a2))
          return t
        finally (return nil)))

(defun p23/solution ()
  (reduce #'+ (remove-if #'is-sum-of-abundant-numbers
                         (range 1 28123))))

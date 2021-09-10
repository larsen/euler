(in-package #:euler)

(defun sum-squared-digits (n)
  (reduce #'+ (mapcar (lambda (m) (* m m))
                      (digits n))))

(defun chain-ends-at (n)
  "Returns the final element of a chain"
  (loop for i = n then (sum-squared-digits i)
        ;; It's given by the problem that this sequence always ends at 1 or 8o
        while (not (or (= i 1)
                       (= i 89)))
        finally (return i)))

(defun p92/solution ()
  (loop for n from 1 below 10000000
        when (= 89 (chain-ends-at n))
          count n into solutions
        finally (return solutions)))

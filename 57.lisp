(in-package #:euler)

(defun continuous-fraction (iteration &optional (base 2))

  ;; (+ 1 (/ 1 (+ 2 0)))                                            ;; 3/2
  ;; (+ 1 (/ 1 (+ 2 (/ 1 2))))                                      ;; 7/5
  ;; (+ 1 (/ 1 (+ 2 (/ 1 (+ 2 (/ 1 2))))))                          ;; 17/12
  ;; (+ 1 (/ 1 (+ 2 (/ 1 (+ 2 (/ 1 (+ 2 (/ 1 (+ 2 (/ 1 2))))))))))  ;; 41/29
  (cond ((= 1 iteration) (/ 1 (+ base 0)))
        ((= 2 iteration) (/ 1 (+ base (/ 1 base))))
        (t (/ 1 (+ base (continuous-fraction (- iteration 1) base))))))

(defun p57/solution ()
  (loop for n from 1 to 1000
        for f = (+ 1 (continuous-fraction n 2))
        when (> (length (write-to-string (numerator f)))
                (length (write-to-string (denominator f))))
          count f into solution-count
        finally (return solution-count)))

(in-package #:euler)

(defun fib (n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (t (+ (fib (- n 1))
          (fib (- n 2))))))

(memoize 'fib)

(defun p25/solution ()
  (loop for n from 1
        until (= (length (format nil "~a" (fib n))) 1000)
        finally (return n)))

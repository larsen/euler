(in-package #:euler)

(defun fib (n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (t (+ (fib (- n 1))
          (fib (- n 2))))))

(defun p2/solution ()
  (loop for n from 0
        while (<= (fib n) 4e6)
        when (= (mod (fib n) 2) 0)
          sum (fib n)))

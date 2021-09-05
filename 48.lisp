(in-package #:euler)

(defun p48/solution ()
  (loop for n from 1 to 1000
        sum (expt n n) into self-powers-sum
        finally (return (let* ((str (write-to-string self-powers-sum))
                               (l (length str)))
                          (subseq str (- l 10))))))

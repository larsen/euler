(in-package #:euler)

(defun p29/solution ()
  (length (unique (loop for a from 2 to 100
                        append (loop for b from 2 to 100
                                     collect (expt a b))))))

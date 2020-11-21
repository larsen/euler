(in-package #:euler)

(defun p1/solution ()
  (loop for i from 1 to 999
        when (or (= 0 (mod i 3))
                 (= 0 (mod i 5)))
          sum i))


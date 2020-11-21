(in-package #:euler)

;; UGLY, to be rewritten
(defun p9/solution ()
  (car (loop for a from 1 to 1000
             append (loop for b from 1 to 1000
                          append (loop for c from 1 to 1000
                                       if (and (= (+ a b c) 1000)
                                               (= (+ (* a a) (* b b))
                                                  (* c c)))
                                         collect (* a b c))))))

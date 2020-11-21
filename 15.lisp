(in-package #:euler)

;; https://en.wikipedia.org/wiki/Lattice_path
(defun p15/solution ()
  (alexandria:binomial-coefficient (+ 20 20) 20))

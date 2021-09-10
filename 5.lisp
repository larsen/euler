(in-package #:euler)

(defun is-divisible-up-to? (number n)
  (declare (optimize speed))
  (declare (type fixnum number n))
  (loop for i of-type integer from 2 to n
        always (zerop (rem number i))))

;; (defun p5/solution ()
;;   (loop for i from 2
;;         when (is-divisible-up-to? i 20)
;;           return i))

;; Faster solution, from the forum
(defun p5/solution ()
  (apply #'lcm
         (loop for i from 1 to 20 collect i)))

(in-package #:euler)

;; 21 22 23 24 25
;; 20  7  8  9 10
;; 19  6  1  2 11
;; 18  5  4  3 12
;; 17 16 15 14 13
;;
;; we can call the side of each "circle" of number its radius.
;; so, for each circle, the set of numbers that lie on the it
;; is {(r-1)^2+1 .. r^2}.
;; Therefore, the first number that appears on a circle is
;; (r-1^2).
;; One of the "corner" numbers is r^2 itself.
;; The others can be calculated subtracting (r-1) from it
;; (three times)

(defun spiral-diagonal-corners (radius)
  (loop repeat 4
        for n = (expt radius 2) then (- n (- radius 1))
        collect n))

(defun p28/solution ()
  (+ 1 ;; the singleton diagonal corner at radius 1
     (reduce #'+ (loop for r from 3 to 1001 by 2
                       append (spiral-diagonal-corners r)))))

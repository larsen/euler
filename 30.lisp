(in-package #:euler)

(defun sum-nth-power-digits (n power)
  (reduce #'+ (mapcar (lambda (k) (expt k power))
                      (digits n))))

(defun sum-4th-power-digits (n)
  (sum-nth-power-digits n 4))

(defun sum-5th-power-digits (n)
  (sum-nth-power-digits n 5))

(defun p30/solution ()
  (reduce #'+
          ;; Found this upper bound by trying,
          ;; but not clear how to demonstrate there
          ;; are no more numbers later
          (loop for n below 1000000
                when (and (not (zerop n))
                          (not (= 1 n))
                          (= n (sum-5th-power-digits n)))
                  do (print n)
                  and collect n)))

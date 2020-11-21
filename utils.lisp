(in-package #:euler)

;; Prime numbers utils

(defun is-prime? (n)
  "Returns T is N is a prime number"
  (loop for i of-type fixnum from 2 to (isqrt n)
        when (zerop (rem n i))
          return nil
        finally (return t)))

(defun primes (n)
  "Returns a list of the first N primes"
  (loop with counter = 0
        for i from 2 
        if (is-prime? i)
          do (incf counter)
          and collect i into lst
        until (= counter n)
        finally (return lst)))

(defun primes-below (n)
  "Returns the list of primes < N"
  (loop for i from 2 
        if (is-prime? i)
          collect i into lst
        until (>= i n)
        finally (return lst)))

(defun prime-factors (n)
  "Returns s list containing the prime factors of N"
  (loop for i from 2 to (sqrt n)
        when (and (is-prime? i)
                  (zerop (rem n i)))
          collect i))

(defun max-prime-factor (n)
  "Return the max prime factor of N"
  (loop for i from 2 to (sqrt n)
        when (and (is-prime? i)
                   (zerop (rem n i)))
          maximizing i into max
        finally (return max)))

(defun divisors (n)
  "Returns the (unsorted) list of divisors of N"
  (declare (type (integer 0) n))
  (let ((first-half (loop for i from 1 to (isqrt n)
                          when (zerop (rem n i))
                            collect i)))
    (append first-half
            (mapcar (lambda (d)
                      (/ n d))
                    first-half ))))

;; Exotic utils

(defun is-palindrome-number? (n)
  (let ((n-as-string (format nil "~D" n)))
    (string= n-as-string
             (reverse n-as-string))))

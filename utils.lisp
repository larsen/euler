(in-package #:euler)

;; Prime numbers utils

(defun is-prime? (n)
  "Returns T is N is a prime number"
  (and (not (= n 1))
       (and (not (zerop (rem n 2)))
        (loop for i of-type fixnum from 3 to (isqrt n) by 2
              always (not (zerop (rem n i)))))))

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
  (primes-from-below 2 n))

(defun totient (n)
  "Returns φ(N)"
  (if (is-prime? n)
      (- n 1)
      (count-if (lambda (k) (relatively-prime n k))
                (range 1 (- n 1)))))

(defun primes-from-below (p n)
  (loop for i from p
        if (and (< i n)
                (is-prime? i))
          collect i into lst
        until (>= i n)
        finally (return lst)))

(defun prime-factors (n)
  "Returns a list containing the prime factors of N"
  (loop for i from 2 to n
        when (and (is-prime? i)
                  (zerop (rem n i)))
          collect i))

(defun factorization (n)
  (loop for i from 2 to (isqrt n)
        when (and (is-prime? i)
                  (zerop (rem n i)))
          return (cons i (factorization (/ n i)))
        finally (return (list n))))

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
    (unique (append first-half
                     (mapcar (lambda (d)
                               (/ n d))
                             first-half )))))

(defun proper-divisors (n)
  (remove-if (lambda (d) (= n d))
             (divisors n)))

(defun amicable? (a b)
  (and (= (reduce #'+ (proper-divisors a)) b)
       (= (reduce #'+ (proper-divisors b)) a)))

(defun is-perfect? (n)
  (= (apply #'+ (proper-divisors n)) n))

(defun is-abundant? (n)
  (> (apply #'+ (proper-divisors n)) n))

(defun is-deficient? (n)
  (< (apply #'+ (proper-divisors n)) n))

;; Sequences

(defun collatz (n)
  "Returns the list of elements of the Collatz sequence starting with N"
  (labels ((next (n)
             (cond
               ((evenp n) (/ n 2))
               ((oddp n) (+ (* 3 n) 1)))))
    (cons n
          (if (= 1 n)
              nil
              (collatz (next n))))))

;; Exotic utils

(defun is-palindrome-number? (n &key (base 10))
  (let* ((format (if (= base 2)
                     "~b"
                     "~d"))
         (n-as-string (format nil format n)))
    (string= n-as-string (reverse n-as-string))))

;; Other utils

(defun digits (n)
  "Returns the list of digits of N (as numbers)"
  (loop for d across (format nil "~A" n)
        collect (digit-char-p d)))

(defun memo (f)
  (let ((cache (make-hash-table)))
    (lambda (x)
      (if (not (gethash x cache))
          (setf (gethash x cache) (funcall f x)))
      (gethash x cache))))

(defun memoize (f)
  (setf (symbol-function f) (memo (symbol-function f))))

(defun unique (sequence)
  (let ((seen (make-hash-table)))
    (loop for e in sequence
          do (incf (gethash e seen 0))
          finally (return (hash-table-keys seen)))))

(defun range (min max)
  (loop for i from min to max
        collect i))

(defmacro defun-memoized (name args &body body)
  `(let ((h (make-hash-table :test #'equalp)))
    (defun ,name ,args
      (if (null (gethash (list ,@args) h))
          (setf (gethash (list ,@args) h)
                (progn ,@body)))
      (gethash (list ,@args) h))))

(defun rotations (n)
  "Returns a list of all the rotations of the digits of N."
  (let ((digits (coerce (format nil "~a" n) 'list)))
    (loop for i below (length digits)
          collect (parse-integer (coerce digits 'string))
          do (setf digits (rotate digits)))))

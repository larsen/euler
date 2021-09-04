(in-package #:euler)

(defun is-truncatable-prime-p (p)
  (let* ((p-as-str (write-to-string p))
         (len (length p-as-str)))
    (and
     (is-prime? p)
     ;; Chop from right
     (loop for i from 1 below len
           for str = (subseq p-as-str 0 i)
           always (is-prime? (parse-integer str)))
     ;; Chop from left
     (loop for i from 1 below len
           for str = (subseq p-as-str i len)
           always (is-prime? (parse-integer str))))))

(defun p37/solution ()
  (loop for p from 11  ; 2, 3, 5, and 7 are not considered to be truncatable primes.
        when (is-truncatable-prime-p p)
          count p into solution-count
          and sum p into solution-sum
        while (< solution-count 11)
        finally (return solution-sum)))

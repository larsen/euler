(in-package #:euler)

(defun p21/solution ()
  (memoize 'proper-divisors)
  (reduce #'+ (remove-duplicates 
               (loop for a below 10000
                     append (loop for b below 10000
                                  when (and (not (= a b))
                                            (amicable? a b))
                                    collect a and collect b)))))

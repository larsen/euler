(in-package :euler)

(defun p24/solution ()
  (let ((permutations '()))
    (map-permutations (lambda (s)
                        (push (parse-integer (format nil "~{~a~}" s))
                              permutations))
                      '(9 8 7 6 5 4 3 2 1 0))
    (nth 999999 (sort permutations #'<))))

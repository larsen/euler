(in-package #:euler)

(defun get-sorted-names-from-file ()
  (sort (mapcar (lambda (str)
                  (remove #\" str))
                (split-sequence
                 #\, (uiop:read-file-string
                      (asdf:system-relative-pathname 'euler "input/p022_names.txt"))))
        #'string<))

(defun string-score (str)
  (loop for c across str
        sum (- (char-code c) 64) into score
        finally (return score)))

(defun p22/solution ()
  (loop for idx from 1
        for str in (get-sorted-names-from-file)
        sum (* idx (string-score str)) into total-score
        finally (return total-score)))

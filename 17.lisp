(in-package #:euler)

(defun british-number-as-string-length (n)
  (let* ((n-as-string (format nil "~r" n))
         (n-as-string-no-spaces (regex-replace-all "(\\s|-)+" n-as-string "")))
    (values
     (+ (cond
          ;; three hundred AND forty-two -> adding 3 chars
          ((and (> n 100)
                (not (= 0 (mod n 100))))
           3)
          (t 0))
        (length n-as-string-no-spaces))
     n-as-string
     n-as-string-no-spaces)))

(defun p17/solution ()
  (loop for n from 1 to 1000
        sum (british-number-as-string-length n) into total_length
        finally (return total_length)))

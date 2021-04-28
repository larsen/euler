(in-package #:euler)

(defun read-triangle ()
  (loop for line in (uiop:read-file-lines
                     (asdf:system-relative-pathname 'euler "input/p067_triangle.txt"))
        collect (loop for n-str in (split-sequence #\Space line)
                     collect (parse-integer n-str))))

(defun p67/triangle-deref (layer pos)
  (handler-case (elt (elt p67/triangle layer) pos)
    (type-error () -1)))

(defun-memoized p67/cost (layer pos)
  (cond
    ((= layer 0) (p67/triangle-deref layer pos))
    (t (+ (p67/triangle-deref layer pos)
          (max (p67/cost (- layer 1) (- pos 1))
               (p67/cost (- layer 1) pos))))))

(defvar p67/triangle (read-triangle))

(defun p67/solution ()
  (loop with max-depth = (- (length p67/triangle) 1)
        for leaf in (first (last p67/triangle))
        for idx from 0
        maximize (p67/cost max-depth idx) into max-cost
        finally (return max-cost)))

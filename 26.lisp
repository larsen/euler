(in-package #:euler)

(defun unit-fraction-decimal-expansion (divisor)
  (let ((steps 0)
        (decimals '())
        (reminders '())
        (seen (make-hash-table)))
    (loop for d = 1 then (* 10 reminder)
          for reminder = (rem 1 divisor)
            then (rem d divisor)
          do (push (/ (- d reminder) divisor) decimals)
             (push reminder reminders)
             (incf steps)
          until (or
                 (= 0 reminder)
                 (gethash reminder seen))
          do (setf (gethash reminder seen) 1)
          finally (return (values decimals
                                  reminders
                                  ;; If the reminder is not 0,
                                  ;; it means we've reachded the
                                  ;; end of the loop because of a
                                  ;; repearing rest, thus starting a cicle.
                                  ;; Yet, we still don't know where the cycle starts
                                  (not (= 0 reminder))
                                  ;; To know where the cycle starts, we need
                                  ;; to find the position of the current value
                                  ;; of reminder in the reversed list of reminders.
                                  ;; the cycle length is the difference between the
                                  ;; length of the reminders list, and this position
                                  (if (not (= 0 reminder))
                                      (- (length reminders)
                                         (position reminder (reverse reminders))
                                         1))
                                  )))))

(defun p26/solution ()
  (loop with max-cycle-length = 0
        with max-cycle-generator
        for n from 1 below 1000
        do (multiple-value-bind (decimals reminders is-cyclic cycle-length)
               (unit-fraction-decimal-expansion n)
             (declare (ignore decimals remindersq))
             (if (and is-cyclic
                      (> cycle-length max-cycle-length))
                 (progn
                   (setf max-cycle-length cycle-length)
                   (setf max-cycle-generator n))))
        finally (return max-cycle-generator)))

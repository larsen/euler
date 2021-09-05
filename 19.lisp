(in-package #:euler)

(defun p19/solution ()
  (loop for day = (local-time:parse-timestring "1901-01-01") then (local-time:timestamp+ day 1 :day)
        while (local-time:timestamp< day (local-time:parse-timestring "2001-01-01"))
        when (and (= 0 (local-time:timestamp-day-of-week day))
                  (= 1 (local-time:timestamp-day day)))
          count day into sundays
          and do (print day)
        finally (return sundays)))

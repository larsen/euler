;;;; euler.asd

(asdf:defsystem #:euler
  :description "My Project Euler solutions"
  :author "Stefano Rodighiero"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:fiveam #:alexandria #:cl-ppcre #:split-sequence)
  :components ((:file "package")
               (:file "utils")
               (:file "1")
               (:file "2")
               (:file "3")
               (:file "4")
               (:file "5")
               (:file "6")
               (:file "7")
               (:file "8")
               (:file "9")
               (:file "10")
               (:file "11")
               (:file "12")
               (:file "13")
               (:file "14")
               (:file "15")
               (:file "16")
               (:file "17")
               (:file "18")
               (:file "20")
               (:file "21")
               (:file "22")
               (:file "23")
               (:file "25")
               (:file "29")
               (:file "35")
               (:file "36")
               (:file "67")
               (:file "euler"))
  :in-order-to ((test-op (test-op #:euler/test))))

(asdf:defsystem #:euler/test
  :depends-on (#:euler
               #:fiveam)
  :components ((:module "tests"
                :components ((:file "main"))))
  :perform (test-op (op _) (symbol-call :fiveam :run-all-tests)))

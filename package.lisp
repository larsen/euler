;;;; package.lisp

(defpackage #:euler
  (:use #:cl)
  (:export is-prime?
   
           p1/solution
           p2/solution
           p3/solution
           p4/solution
           p5/solution
           p6/solution
           p7/solution
           p8/solution
           p9/solution
           p10/solution
           p11/solution
           p12/solution))

(defpackage #:euler/test
  (:use #:cl
        #:euler
        #:fiveam))

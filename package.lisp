;;;; package.lisp

(defpackage #:euler
  (:use #:cl #:alexandria #:cl-ppcre #:split-sequence)
  (:export is-prime?
           prime-factors
           totient

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
           p12/solution
           p13/solution
           p14/solution
           p15/solution
           p16/solution
           p17/solution
           p18/solution
           p20/solution
           p21/solution
           p22/solution
           p23/solution
           p24/solution
           p25/solution
           p26/solution
           p29/solution
           p35/solution
           p36/solution
           p67/solution))

(defpackage #:euler/test
  (:use #:cl
        #:euler
        #:fiveam))

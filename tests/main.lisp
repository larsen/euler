(in-package #:euler/test)

(def-suite project-euler)
(in-suite project-euler)

(test utils
  ;; Primality test
  (is-true (is-prime? 2))
  (is-true (is-prime? 3))
  (is-true (is-prime? 17))
  (is-false (is-prime? 100))

  (is (equal (prime-factors 4) '(2)))
  (is (equal (prime-factors 15) '(3 5)))

  (is (equal (totient 2) 1))
  (is (equal (totient 5) 4))
  (is (equal (totient 10) 4)))

(test problems
  (is (= (p1/solution) 233168))
  (is (= (p2/solution) 4613732))
  (is (= (p3/solution) 6857))
  (is (= (p4/solution) 906609))
  (is (= (p5/solution) 232792560))
  (is (= (p6/solution) 25164150))
  (is (= (p7/solution) 104743))
  (is (= (p8/solution) 23514624000))
  (is (= (p9/solution) 31875000))
  (is (= (p10/solution) 142913828922))
  (is (= (p11/solution) 70600674))
  (is (= (p12/solution) 76576500))
  (is (string= (p13/solution) "5537376230"))
  (is (= (p14/solution) 837799))
  (is (= (p15/solution) 137846528820))
  (is (= (p16/solution) 1366))
  (is (= (p17/solution) 21124))
  (is (= (p18/solution) 1074))
  (is (= (p20/solution) 648))
  (is (= (p21/solution) 31626))
  (is (= (p22/solution) 871198282))
  (is (= (p23/solution) 4179871))
  (is (= (p25/solution) 4782))
  (is (= (p29/solution) 9183))
  (is (= (p35/solution) 55))
  (is (= (p36/solution) 872187))
  (is (= (p67/solution) 7273)))

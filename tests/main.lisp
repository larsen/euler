(in-package #:euler/test)

(test utils
  (is-true (is-prime? 2))
  (is-true (is-prime? 3))
  (is-true (is-prime? 17))
  (is-false (is-prime? 100)))

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
  (is (= (p11/solution) 70600674)))

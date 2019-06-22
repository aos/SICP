; Vectors (aka arrays)

(define v
  (vector 1 2 '(11 hi) 4 "hello"))

(vector-ref v 2) ; '(11 hi)
(vector-set! v 3 '(3 4 5)) ; #(1 2 (11 hi) (3 4 5) "hello")

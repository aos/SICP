; Exercise 1.7
; Newton's method of successive approximation for finding the square root

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                  x)))

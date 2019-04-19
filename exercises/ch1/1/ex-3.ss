; Exercise 1.3
; Sum of the squares of the largest two numbers
(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (sum-of-largest-squares x y z)
  (sum-of-squares 
    (cond ((or (> x y) (> x z)) x)
          ((or (> y x) (> y z)) y)
          (else z))
    (cond ((or (> z x) (> z y)) z)
          ((or (> y x) (> y z)) y)
          (else x))
  ))

(define (abs x)
  (cond ((> x 0) x) ; (<p1> <e>) predicates are evaluated until true
        ((= x 0) 0) ; at which point the consequent expression <e> is returned
        ((< x 0) (- x))) ; (- x) is a negation operator

; Written another way:
(define (abs-two x)
  (cond ((< x 0) (- x))
        (else x)))

; Using `if`
; (if <predicate> <consequent> <alternative>) <- ternary operator
(define (abs-if x)
  (if (< x 0)
      (- x)
      x))

(abs-two -3)
(abs 4)

; Exercise 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

; Exercise 1.3 -- Sum of the squares of the largest two numbers
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

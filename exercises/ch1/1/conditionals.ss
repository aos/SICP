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

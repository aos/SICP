; Exercise 3.33
; Define 'averager' using multiplier, adder, and constant constraints
; 2C = A + B

(define (averager a b c)
  (let ((u (make-connector))
        (v (make-connector)))
    (multiplier c v u)
    (adder a b u)
    (constant 2 v)
    'ok))

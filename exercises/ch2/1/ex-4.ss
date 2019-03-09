; Alternative representation of pairs

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define test (cons 3 4)) ; (lambda (m) (m 3 4)) 
(car test)
; (car (lambda (m) (m 3 4)))
; ((lambda (m) (m 3 4)) (lambda (p q) p))
; ((lambda (p q) p) 3 4) 
; 3 

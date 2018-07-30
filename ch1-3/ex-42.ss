; Exercise 1.42
; Implement 'compose'

; The composition of 'f' after 'g' is defined as 'x → f(g(x))'

(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x) (+ x 1))

((compose square inc) 6) ; 49

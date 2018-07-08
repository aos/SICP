; Ackermann function
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; f(n) = 2n
(define (f n) (A 0 n))

; g(n) = 2^n
; === Ex (A 1 3):
; (A (- 1 1) (A 1 (- 3 1)))
; (A 0 (A 1 2))
; (A 0 (A (- 1 1) (A 1 (- 2 1))))
; (A 0 (A 0 (A 1 1)))
; (A 0 (A 0 2))
; (A 0 4) -> 8
(define (g n) (A 1 n))

; h(n) = 2^(2^n)
; Refer to './acks' file for example expansion
(define (h n) (A 2 n))

; To go around max recursion depth, let's define 'h' in terms of 'g'
(define (o n) (g (g n)))

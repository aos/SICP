; Exercise 3.40
; All possible values of x that can result from:

(define x 10)
(parallel-execute
  (lambda () (set! x (* x x)))
  (lambda () (set! x (* x x x))))

; 1,000,000: P1 -> P2, or P2 -> P1, P2 x2 P1 x2 + call P2 x1
; 10,000: P1 x1 (10), P2 x3 (1000), P1 x1 (10 * 1000)
; 100,000: P1 x1 (10), P2 x1 (10), P1 x1 (10) + call (100), P2 x2 (100^2 * 10)
; ...

; After serialization, only 1,000,000 remains (P1 -> P2, P2 -> P1)

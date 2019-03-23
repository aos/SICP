; Exercise 3.55
; Define 'partial-sums'
; Returns S0, S0 + S1, S0 + S1 + S2

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (partial-sums stream)
  (cons-stream
    (stream-car stream)
    (add-streams (partial-sums stream) (stream-cdr stream))))

;;
(partial-sums integers) ; (1 3 6 10 15...)

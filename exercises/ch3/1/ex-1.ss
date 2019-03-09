; Exercise 3.1
; Accumulator procedure

(define (make-accumulator start)
  (lambda (amount)
    (begin (set! start (+ start amount))
           start)))

(define A (make-accumulator 5))
(A 10) ; 15
(A 10) ; 25

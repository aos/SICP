; Exercise 4.25
; unless in factorial

(define (factorial n)
  (unless (= n 1)
          (* n (factorial (- n 1)))
          1))

; This won't work in MIT scheme (applicative-order, strict) because it will
; always attempt to evaluate the first expression under the predicate,
; resulting in an infinite loop.

; This will work in a normal-order language because only the values that are
; needed are evaluated

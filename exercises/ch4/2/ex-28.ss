; Exercise 4.28

; We force the operator (using 'actual-value') because we will need the actual
; procedure to send to 'apply'

; An example
(define (g x) (+ x 1))
(define (f g x) (g x))

; Calling (f g 10), if we don't use actual-value, 'g' will be passed in as a
; parameter which will be delayed, then 'g' is a thunk, and can't be used as a
; function to call 10.

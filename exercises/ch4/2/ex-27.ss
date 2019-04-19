; Exercise 4.27

(define count 0)
(define (id x) (set! count (+ count 1)) x)

(define w (id (id 10)))

count ; => 1

w ; => 10

count ; 2

; When defining 'w', the outer (id) is evaluated, thus setting 'count' to 1.
; The inner 'x' in the outer (id) is turned into a thunk, only when evaluating
; 'w' do we evaluate the thunk, which evaluates the inner (id) -> producing a
; count of 2

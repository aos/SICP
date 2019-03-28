; Exercise 3.63
  

(define (sqrt-improve guess init)
    (define (average x y)
      (/ (+ x y) 2))
    (average guess (/ init guess)))

(define (sqrt-stream x)
  (cons-stream
    1.0
    (stream-map (lambda (guess)
                  (sqrt-improve guess x))
                (sqrt-stream x))))

; The redundant computations occur as part of the stream given to the map
; function. Whenever we call 'stream-cdr' on sqrt-stream, we have to call
; sqrt-stream again. Memoization would not be effective here because we are
; effectively it calling it on a "new" object. The interpreter cannot
; distinguish.

; Exercise 3.68

(define (pairs s t)
  (interleave
    (stream-map (lambda (x)
                  (list (stream-car s) x))
                t)
    (pairs (stream-cdr s) (stream-cdr t))))

; This does not work -- we run into an infinite loop. The reason for this is
; that when pairs gets called, it evaluates interleave which needs to evaluate
; its two arguments, which calls pairs again, which calls interleave again ad
; infinitum.

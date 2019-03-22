; Exercise 3.39
; Which of the five possibilities in parallel execution remain if we serialize
; execution as follows:

(define x 10)
(define s (make-serializer))
(parallel-execute
  (lambda ()
    (set! x ((s (lambda () (* x x))))))
  (s (lambda () (set! (+ x 1)))))

; Since P1's (set! x) can be interleaved between P2 calls, the output can be
; any one of: (11 100 101 121)

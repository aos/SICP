; Exercise 4.15
; Halting problem -> (halts? p)

; (if (p a)
;     --> halts
;     Not halted)

(define (run-forever)
  (run-forever))

(define (try p)
  (if (halts? p p)
      (run-forever)
      'halted))

; If we run (try try) -> (halts? try try) will be true, but it will run
; forever. If 'try can't halt, (halt? try try) will be false, but procedure
; will halt.

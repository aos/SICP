; Exercise 3.29
; Construct an 'or-gate' using 'and-gates' and 'inverters'
; What is the delay time of the 'or-gate' in terms of 'and-gate-delay' and
; 'inverter-delay'?

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((b1 (make-wire))
          (b2 (make-wire))
          (pre (make-wire)))
      (inverter a1 b1)
      (inverter a2 b2)
      (and-gate b1 b2 pre)
      (inverter pre output)))
  (or-action-procedure)
  'ok)

; The delay time is 2x inverter + 1 and-gate delay time

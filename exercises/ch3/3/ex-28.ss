; 3.28
; Define an 'or-gate'

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
            (logical-or (get-signal a1)
                        (get-signal a2))))
      (after-delay
        or-gate-delay
        (lambda ()
          (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)

(define (logical-or x y)
  (cond ((or (< x 1) (> x 1)
             (< y 0) (> y 1))
         (error "Invalid signal" x y))
        ((or (= x 1) (= y 1)) 1)
        (else 0)))

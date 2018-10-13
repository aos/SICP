; Exercise 2.75
; Implement 'make-from-mag-ang' using message-passing

(define (make-from-mag-ang x y)
  (define (dispatch op)
    (cond ((eq? op 'magnitude) x)
          ((eq? op 'angle) y)
          ((eq? op 'real-part)
           (* x (cos y)))
          ((eq? op 'imag-part)
           (* x (sin y)))
          (else
            (error "Unknown op:
                   MAKE-FROM-MAG-ANG" op))))
  dispatch)

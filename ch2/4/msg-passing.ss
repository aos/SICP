; Message passing
; Work with intelligent data objects that dispatch on operation names

; We define 'make-from-real-imag' as:
(define (make-from-real-imag x y)
  (define (dispatch op)
    (cond ((eq? op 'real-part) x)
          ((eq? op 'imag-part) y)
          ((eq? op 'magnitude)
           (sqrt (+ (square x) (square y))))
          ((eq? op 'angle) (atan y x))
          (else
            (error "Unknown op:
                   MAKE-FROM-REAL-IMAG" op))))
  dispatch)

; In this case, calling 'make-from-real-imag' binds the 'x' and 'y' values and
; based on the operation given, will do something different

; Now we can re-write the 'apply-generic' procedure to feed the operation's name
; to the data object and let the object do the work:
(define (apply-generic op arg) (arg op))

; Example
(apply-generic 'angle
               (make-from-real-imag 3 4))

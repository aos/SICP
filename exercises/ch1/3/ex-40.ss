; Exercise 1.40
; 'cubic' method used together with 'newtons-method'

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (newtons-method g guess)
  (fixed-point (newton-transform g)
               guess))

(define (cubic a b c)
  (newtons-method
    (lambda (x) (+ (cube x)
                   (* a (square x))
                   (* b x)
                   c))
    1.0))

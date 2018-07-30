; Procedures as returned values

; Proc which takes as its argument a procedure 'f' and returns as its value
; a procedure (the lambda) that, when applied to a number 'x', produces the
; average of 'x' and '(f x)'

(define (average-damp f)
  (define (average a b) (/ (+ a b) 2))
  (lambda (x)
    (average x (f x))))

((average-damp square) 10) ; 55

; Using average-damp, we can reformulate the 'sqrt' procedure:
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

; The square root is just a fixed point of the function 'y → x/y'
(define (sqrt x)
  (fixed-point
    (average-damp
      (lambda (y) (/ x y)))
    1.0))

; The cube root is just a fixed point of the function 'y → x/y²'
(define (cube-root x)
  (fixed-point
    (average-damp
      (lambda (y)
        (/ x (square y))))
    1.0))

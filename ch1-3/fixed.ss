; Finding fixed points of functions
; A number 'x' is called a fixed point of a function 'f' if x satisfies the
; equation 'f(x) = x'. For some functions 'f', we can locate it by beginning
; with an initial guess and applying 'f' repeatedly:
;                     'f(x), f(f(x)), f(f(f(x))), ...'
; until the value doesn't change very much.

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

; Using this method to approximate the fixed point of the cosine function:
(fixed-point cos 1.0)

; Finding a solution to the equation 'y = sin y + cos y':
(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0)

; Computing the square root of some number 'x' requires finding a 'y' such that
; 'y² = x'. Putting this equation into the equivalent form 'y = x/y', we
; recognize that we are looking for a fixed point function 'y → x/y':

(define (sqrt x)
  (fixed-point (lambda (y) (/ x y))
               1.0))

; This does not converge due to guesses being: 1.0 -> 9.0 -> 1.0 -> 9.0...
; To control these oscillations, and since the answer is always between our
; guess 'y' and 'x/y', we can make a new guess that is not as far from 'y' as
; 'x/y' by averaging 'y' with 'x/y' so that the next guess after 'y' is
; '(1/2)(y + x/y)'

(define (sqrt x)
  (define (average x y) (/ (+ x y) 2))
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

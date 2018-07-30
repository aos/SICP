; Newton's method

; f(x) = x - (g(x) / (Dg(x)))
; where, Dg(x) is the derivative of 'g' evaluated at 'x'
; Dg(x) = (g(x + dx) - g(x)) / dx

(define (deriv g)
  (define dx 0.00001)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

; To approximate the derivative of 'x → x³' at 5:
(define (cube x) (* x x x))

((deriv cube) 5) ; 75.0001

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

; With the aid of 'deriv' we can express Newton's method as a fixed-point
; process:
(define (newton-transform g)
  (- x (/ (g x)
          ((deriv g) x))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g)
               guess))

; To find the square root of 'x', we can use Newton's method to find a zero of
; the function 'y → y² - x' starting with an initial guess of 1.
(define (sqrt x)
  (newtons-method
    (lambda (y) (- (square y) x))
    1.0))

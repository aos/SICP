; Abstractions and first-class procedures

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

; Since each method begins with a function and finds a fixed point of some
; transformation of the function, we can express this general idea itself as a
; procedure:

(define (fixed-point-of-transform
          g transform guess)
  (fixed-point (transform g) guess))

; Using this abstraction, we can recast the first square-root computation (with
; average damping version of 'y → x/y') as an instance of this general method:

(define (average-damp f)
  (define (average a b) (/ (+ a b) 2))
  (lambda (x)
    (average x (f x))))

(define (sqrt x)
  (fixed-point-of-transform
    (lambda (y) (/ x y))
    average-damp
    1.0))

; Likewise with Newton's method for square-roots 'y → y² - x':

(define (sqrt x)
  (fixed-point-of-transform
    (lambda (y) (- (square y) x))
    newton-transform
    1.0))

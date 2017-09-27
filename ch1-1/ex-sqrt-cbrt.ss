; Exercise 1.6 - new-if
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; ========

; Exercise 1.7
; Newton's method of successive approximation for finding the square root
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                  x)))

; A guess is improved by averaging it
; with the quotient of the radicand and the old guess
(define (improve guess x)
  (average guess (/ x guess)))

; Define average
(define (average x y)
  (/ (+ x y) 2))

; Improved good-enough
; Calcuates rate of change (X1 - X0) / X0
(define (good-enough? guess x)
  (< (abs (/ (- (improve guess x) guess) 
             guess)) 
      0.001))

; Let's initialize with sqrt
(define (sqrt x) 
  (sqrt-iter 1.0 x))

; =======

; Exercise 1.8 - Cube roots
; With internal definitions, using lexically scoped `x`
(define (cbrt x)
  (define (square y) (* y y))

  (define (better guess)
    (/ 
      (+ (/ x (square guess)) (* 2 guess)) 
      3))

  (define (is-good? guess)
    (< (abs (/ (- (better guess) guess)
              guess))
      0.001))

  (define (cbrt-iter guess)
    (if (is-good? guess)
      guess
      (cbrt-iter (better guess))))

  (cbrt-iter 1.0))

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

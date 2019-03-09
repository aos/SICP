; == Second time around taking notes

; Start with our radicand (number whose square root we are trying to compute)
; and a value for the guess
(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x)
                 x)))

; A guess is improved by averaging it with quotient of radicand and old guess
(define (improve guess x)
  (average guess (/ x guess)))

; Average function
(define (average x y)
  (/ (+ x y) 2))

; Number 2
; Guess: 1
; Improve: (1 + (2/1))/2
; Guess: 1.5
; Improve: (1.5 + (2/1.5))/2

(define (good-enough? old-guess new-guess)
  (< (delta-diff new-guess old-guess) 0.0001))

(define (square x) (* x x))

(define (sq x)
  (sqrt-iter 1.0 x))

; Calculates the rate of change between 2 numbers
(define (delta-diff x y)
  (abs (/ (- x y) y)))

(sq 9)

; 1.8 Cube roots
(define (cbrt x)

  (define (cbrt-iter guess)
    (if (good-enough? guess (improve-cb guess))
      guess
      (cbrt-iter (improve-cb guess))))

  (define (improve-cb y)
    (/ 
      (+ (/ x (square y)) (* 2 y)) 
      3))

  (cbrt-iter 1.0))

(cbrt 8)

; Exercise 1.46 - Iterative Improvement
; Write a procedure 'iterative-improve' that takes two procedures as arguments:
; a method for telling whether a guess is good enough and a method for improving
; a guess

(define (iterative-improve f-good-enough? f-improve-guess)
  (define (try guess)
    (let ((next (f-improve-guess guess)))
      (if (f-good-enough? next guess)
          next
          (try next))))
  (lambda (g) (try g)))

; Define 'square-root' in terms of 'iterative-improve'
(define (sq x)
  (define (sqrt-improve guess)
    (define (average x y) (/ (+ x y) 2))
    (average guess (/ x guess)))
  (define (sqrt-good-enough? g _)
    (< (abs (- (square g) x))
        0.001))
  ((iterative-improve sqrt-good-enough? sqrt-improve) 1.0))

(sq 2) ; Test it out

; Define 'fixed-point' in terms of 'iterative-improve'
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (define tolerance 0.00001)
    (< (abs (- v1 v2))
       tolerance))
  ((iterative-improve close-enough? f) first-guess))

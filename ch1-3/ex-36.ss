; Exercise 1.36
; Find a solution to (x^x = 1000) by finding a fixed point of
; 'x → log(1000)/log(x)'
; Compare steps with and without average dampening

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (display "Guess: ") (display guess) (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

; Without average damping
(fixed-point
  (lambda (x) (/ (log 1000) (log x)))
   2)

; With average damping
(define (average x y) (/ (+ x y) 2))
(fixed-point
  (lambda (x) (average x (/ (log 1000) (log x))))
   2)

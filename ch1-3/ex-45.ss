; Exercise 1.45

; How many average damps are required to compute n-th roots as a fixed-point
; search based upon repeated average damping of 'y → x/y^(n-1)'?

; Use this to implement a simple procedure for computing n-th roots using
; 'fixed-point', 'average-damp', and the 'repeated' procedure.

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

(define (average-damp f)
  (define (average a b) (/ (+ a b) 2))
  (lambda (x)
    (average x (f x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

; Simple procedure for computing 'n-th' roots
(define (n-root x n)
  (fixed-point
    ((repeated average-damp n)
     (lambda (y) (/ x (expt y (- n 1)))))
    1.0))

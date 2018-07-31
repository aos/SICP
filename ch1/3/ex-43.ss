; Exercise 1.43
; Form the 'n-th' repeated application of 'f'

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

((repeated square 2) 5)

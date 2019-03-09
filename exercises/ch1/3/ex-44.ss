; Exercise 1.44

; Define 'smooth' and 'repeated-smooth'

(define (smooth f)
  (define dx 0.00001)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

; Exercise 1.37 - Infinite Continued Fractions

; Recursively
(define (cont-frac n d k)
  (define (frac start)
    (let ((nth (n start))
          (dth (d start)))
      (if (> start k)
          0
          (/ nth (+ dth (frac (+ 1 start)))))))
  (frac 1))

; 1. 'k' only needs to be accurate to 4 places
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

; 2. Iteratively
(define (cont-frac n d k)
  (define (frac-iter start result)
    (let ((nth (n start))
          (dth (d start)))
      (if (> start k)
          result
          (frac-iter (+ 1 start) (/ nth (+ dth result))))))
  (frac-iter 1 0))

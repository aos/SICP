; Exercise 1.39
; Continued fraction representation of the tangent function

(define (tan-cf x k)
  (define (loop start)
    (if (> start k)
        1.0
        (- start (/ (square x) (loop (+ 2 start))))))
  (/ x (loop 1)))

(define (cont-frac n d k)
  (define (frac start)
    (let ((nth (n start))
          (dth (d start)))
      (if (> start k)
          0
          (/ nth (+ dth (frac (+ 1 start)))))))
  (frac 1.0))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (* x x))))
             (lambda (i) (- (* i 2) 1))
             k))

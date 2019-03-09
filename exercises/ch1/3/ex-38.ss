; Exercise 1.38
; Euler's continued fraction expansion for 'e - 2'
; 'N_i = 1' 
; 'D_i = [1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ...]'
;         1  2  3  4  5  6  7  8  9 10 11

(define (cont-frac n d k)
  (define (frac start)
    (let ((nth (n start))
          (dth (d start)))
      (if (> start k)
          0
          (/ nth (+ dth (frac (+ 1 start)))))))
  (frac 1))

(+ 2 (cont-frac (lambda (i) 1.0)
                (lambda (i) (cond ((or (= i 1) (= i 2)) i)
                            ((= (remainder i 3) 2) (* 2 (ceiling (/ i 3))))
                            (else 1.0)))
                10000))

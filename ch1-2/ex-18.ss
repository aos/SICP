; Exercise 1.18
; Iterative multiplication using logarithmic # of steps

(define (* a b)
  (define (mult-it a b product)
    (define (double n) (+ n n))
    (define (halve n) (/ n 2))
    (define (even? n)
      (= (remainder n 2) 0))
    (cond ((= b 0) product)
          ((even? b) (mult-it (double a) (halve b) product))
          (else (mult-it a (- b 1) (+ a product)))))
  (mult-it a b 0))

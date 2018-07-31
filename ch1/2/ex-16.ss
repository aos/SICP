; Exercise 1.16 (logarithmic iterative exponentiation)
; Iterative exponentiation process that uses successive squaring and uses a
; logarithmic # of steps
; This works because (b^(n/2))^2 = (b^2)^(n/2)

(define (exp b n)
  (define (square x) (* x x))
  (define (even? n)
    (= (remainder n 2) 0))
  (define (fast-it b counter a)
    (cond ((= counter 0) a)
          ((even? counter) (fast-it (square b) (/ counter 2) a))
          (else (fast-it b (- counter 1) (* b a)))))
  (fast-it b n 1))

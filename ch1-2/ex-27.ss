; Exercise 1.27

; Test the Carmichael numbers that fool the Fermat test
(define (carm n)
  ; Check for primality
  (define (test a)
    (= (remainder (expt a n) n) (remainder a n)))
  ; Check all integers a < n, if all are true, return 'true' otherwise 'false'
  (define (carm-test a)
    (cond ((= a 0) #t)
          ((test a) (carm-test (- a 1)))
          (else #f)))
  (carm-test (- n 1)))

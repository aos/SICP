; Exercise 1.27

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

; Test the Carmichael numbers that fool the Fermat test
; 561, 1105, 1729, 2465, 2821, 6601
(define (carm n)
  ; Check for primality
  (define (test a)
    (= (expmod a n n) (remainder a n)))
  ; Check all integers a < n, if all are true, return 'true' otherwise 'false'
  (define (carm-test a)
    (cond ((= a 0) #t)
          ((test a) (carm-test (- a 1)))
          (else #f)))
  (carm-test (- n 1)))

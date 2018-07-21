; Smallest integral divisor (greater than 1) of a given number 'n'

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

; To test prime, 'n' is prime if and only if 'n' is its own smallest divisor
(define (prime? n)
  (= n (smallest-divisor n)))

; Exercise 1.21
; 199 => 199
; 1999 => 1999
; 19999 => 7

; Exercise 1.22
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; Write a procedure "search-for-primes" that checks the primality of consecutive
; odd integers in a specified range
(define (search-for-primes start end)
  (timed-prime-test start)
  (cond ((>= start end) (display "COMPUTATION COMPLETE"))
        ((even? start) (search-for-primes (+ start 1) end))
        (else (search-for-primes (+ start 2) end))))

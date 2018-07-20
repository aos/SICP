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

; Fermat's Little Theorem
; If 'n' is a prime number and 'a' is any positive integer less than 'n', then
; 'a' raised to the 'n'-th power is congruent to 'a' modulo 'n'.
; Eg: (a^n) / n = x remainder a
;     (a^n) ≡ a mod n

; We can also test for primality using Fermat's theorem. Given a number 'n',
; pick a random number 'a < n', and compute the remainder of 'a^n' modulo 'n'.
; If the result is not equal to 'a', then 'n' is certainly not a prime. If it is
; 'a', then chances are good that 'n' is a prime. Now repeat with another random
; number 'a' and test it with the same method. If it also satisfies the
; equation, we can be more confident that 'n' is a prime. This algorithm is
; known as the Fermat test.

; To implement the Fermat test, we need a procedure that computes the
; exponential of a number modulo another number.

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

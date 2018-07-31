; Greatest Common Divisor

; Algorithm:
; If 'r' is the remainder when 'a' is divided by 'b', then the common divisors
; of both 'a' and 'b' are precisely the same as the common divisors of 'b' and
; 'r'.
; GCD(a, b) = GCD(b, r)
;
; Example: 
; GCD(206, 40) = GCD(40, 6)
;              = GCD(6, 4) => GCD(4, 2) => GCD(2, 0) => 2

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Exercise 1.20
; (gcd 206 40) Normal order evaluation vs applicative order evaluation
; How many remainder operations in normal order (fully expand then reduce) 
; vs applicative order evaluation?
; Normal order:
; 1. (gcd 206 40) => (gcd 40 (remainder 206 40))
; 2. (gcd 40 6) => (gcd 6 (remainder 40 6))
; 3. (gcd 6 4) => (gcd 4 (remainder 6 4))
; 4. (gcd 4 2) => (gcd 2 (remainder 4 2))

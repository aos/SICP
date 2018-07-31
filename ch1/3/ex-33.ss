; Exercise 1.33 - Filtered accumulate procedure
; Use a 'filter' procedure on the terms to be combined

(define (filtered-accumulate
         combiner fil null-value term a next b)
  (cond ((>= a b) null-value)
        ((fil a)
         (combiner (term a)
                   (filtered-accumulate
                    combiner fil null-value term (next a) next b)))
        (else (filtered-accumulate
               combiner fil null-value term (next a) next b))))

(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor n test-divisor)
      (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor n (+ test-divisor 1)))))
    (find-divisor n 2))
  (define (divides? a b)
    (= (remainder b a) 0))
  (if (= n 1) #f (= n (smallest-divisor n))))

; 1. Sum of the squares of prime numbers in the interval 'a' to 'b'
(define (sum-squared-primes a b)
  (define (inc x) (+ x 1))
  (filtered-accumulate
   + prime? 0 square a inc b))

(sum-squared-primes 1 3) ; => 4
(sum-squared-primes 1 4) ; => 13
(sum-squared-primes 1 5) ; => 13

; 2. Product of all positive integers less than `n` that are relatively prime to
; `n` (all positive integers `i < n` such that `GCD(i, n) = 1`)
(define (relative-prime-product n)
  (define (inc x) (+ x 1))
  (define (id x) x)
  (define (relatively-prime i)
    (= (gcd i n) 1))
  (filtered-accumulate
   * relatively-prime 1 id 1 inc n))

(relative-prime-product 10) ; => 189

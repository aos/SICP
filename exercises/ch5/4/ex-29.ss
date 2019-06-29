; Exercise 5.29
; Monitoring recursive fibonacci

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))

; 1. Formula for max stack depth in terms of n
; max-stack-depth = (n * 5) + 3

; 2. Formula for number of pushes
; S(n) = S(n-1) + S(n-2) + 40
; S(n) = 56 * Fib(n+1) - 40

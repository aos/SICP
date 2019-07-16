; Exercise 5.46
; Analyze run and space-times of tree-recursive fibonacci

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))

; Compiled
; pushes  = 7 * fib(n + 1) - 3
; depth   = 2n - 2

; Interpreted
; pushes  = 56 * fib(n + 1) - 40
; depth   = 5n - 3

; Special
; pushes  = 3 * fib(n + 1) - 3
; depth   = 2n - 2

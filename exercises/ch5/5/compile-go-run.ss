; Compile and run procedures

(load "compile-go.ss")

(compile-and-go
  '(define (fib n)
     (if (< n 2)
         n
         (+ (fib (- n 1))
            (fib (- n 2)))))

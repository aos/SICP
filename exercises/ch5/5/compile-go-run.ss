; Compile and run procedures

(load "compile-go.ss")

(compile-and-go
  '(define (factorial n)
     (if (= n 1)
         1
         (* (factorial (- n 1)) n))))

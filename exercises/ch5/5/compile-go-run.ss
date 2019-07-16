; Compile and run procedures

(load "compile-go.ss")

(compile-and-go
  '(define (f n)
     (+ 3 (g n))))

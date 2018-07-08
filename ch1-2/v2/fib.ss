; Fibonacci function (recursive)
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

; Iterative
(define (f n)
  (define (iter a b count)
    (if (= count 0)
        a
        (iter b (+ a b) (- count 1))))
  (iter 0 1 n))

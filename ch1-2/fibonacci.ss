; Recursive procedure
; This is a tree recursive procedure, each call (outside of base cases)
; are followed with 2 more calls to the procedure
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

; Iterative procedure
; This grows linearly in `n`
(define (fib n)
  (define (iter a b count)
    (if (= 0 count) a
      (iter b 
            (+ a b)
            (- count 1))))
  (iter 0 1 n))

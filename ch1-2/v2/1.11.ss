; A function `f` is defined by the rule that `f(n) = n if n < 3` and 
; `f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3`. Write a procedure to
; compute through a recursive and iterative process

; Recursive
(define (f n)
  (if (< n 3)
      n
      (+
        (f (- n 1))
        (* 2 (f (- n 2)))
        (* 3 (f (- n 3))))))

; Iterative
(define (f-iterative n)
  (define (f-it a b c count)
    (cond ((< n 3) n)
          ((= n count) a)
          (else 
            (f-it
              (+ a (* 2 b) (* 3 c))
              a
              b
              (+ 1 count)))))
  (f-it 2 1 0 2))

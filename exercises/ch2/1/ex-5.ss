; Exercise 2.5 - x
; Represent pairs of nonnegative integers using only numbers and arithmetic
; operations.
; Represent the pair 'a' and 'b' as the integer that is the product
; '2^(a) * 3^(b)'. Give the definitions of the procedures 'cons', 'car', 'cdr'.

(define (exp base n)
  (define (iter x result)
    (if (= 0 x)
        result
        (iter (- x 1) (* base result))))
  (iter n 1))

; We find the remainder of the constructed product with one of the bases we are
; using (2 or 3) and iteratively continue if it is '0'. Once we find a remainder
; that is not equal to 0, we take the one previous.
(define (count-0-remainders n divisor)
  (define (iter try-exp)
    (if (= 0 (remainder n (exp divisor try-exp)))
        (iter (+ try-exp 1))
        (- try-exp 1)))
  (iter 1))

(define (my-cons a b)
  (* (exp 2 a) (exp 3 b)))

(define (my-car x)
  (count-0-remainders x 2))

(define (my-cdr x)
  (count-0-remainders x 3))

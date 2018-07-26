; Exercise 1.32
; The 'accumulate' procedure
; 'combiner' (2 args): how current term is to be combined
; 'null-value': base value to use when the terms run out

; Recursive
(define (accumulate
         combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate
                 combiner null-value term (next a) next b))))

; Iterative
(define (acc-iter
         combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

; Define 'sum' and 'product' in terms of 'accumulate'
(define (sum term a next b)
  (acc-iter + 0 term a next b))

(define (product term a next b)
  (acc-iter * 1 term a next b))

; Helpers
(define (identity x) x)
(define (inc x) (+ x 1))

(sum identity 0 inc 5)
(product identity 1 inc 5)

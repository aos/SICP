; Exercise 1.31
; Write an analogous procedure to 'sum' called 'product'

; 1. Recursive
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; Now define 'factorial' in terms of 'product'
(define (inc x) (+ x 1))
(define (identity x) x)
(define (factorial n)
  (product identity 1 inc n))

(factorial 3)
(factorial 5)

; Use 'product' to compute approximates to 'π' using the formula:
; π = 2 * 4 * 4 * 6 * 6 * 8 * ...
; -   ---------------------------
; 4 = 3 * 3 * 5 * 5 * 7 * 7 * ...

(define (wallis n)
  (define (top x) (if (odd? x) (+ x 1) (+ x 2)))
  (define (bottom x) (if (odd? x) (+ x 2) (+ x 1)))
  (* 4.0
     (/ (prod-it top 1 inc n)
        (prod-it bottom 1 inc n))))

; Refining the procedure using only a single term
; The idea here is that instead of using a top and bottom function, we calculate
; each 'n' as a whole
(define (wallis n)
  (define (pi-term n)
    (if (even? n)
        (/ (+ n 2) (+ n 1))
        (/ (+ n 1) (+ n 2))))
  (* 4.0 (product pi-term 1 inc n)))

; 2. Iterative
(define (prod-it term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

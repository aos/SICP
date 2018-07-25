; 1.3.1 Procedures as Arguments

(define (cube n)
  (* n n n))

; Given these 2 procedures which have similar structures:
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

; Create a common template
; 'term' is the procedure applied to 'a'
; 'next' is the procedure which will increment 'a'
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; Now let's re-write sum-cubes, passing in the procedures as arguments
(define (inc n) (+ n 1))
(define (sum-cubes-two a b)
  (sum cube a inc b))

; We can also re-define 'sum-integers' in terms of 'sum', using the identity:
(define (identity x) x)
(define (sum-integers-two a b)
  (sum identity a inc b))

; We can also define 'pi-sum' in the same way:
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

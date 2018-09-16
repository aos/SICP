; Exercise 2.57
; Extend differentiation to handle sums and products of arbitrary numbers of
; terms

(define (deriv expr var)
  (cond ((number? expr) 0)
        ((variable? expr)
         (if (same-variable? expr var) 1 0))
        ; d(u + v)/dx = du/dx + dv/dx
        ((sum? expr)
         (make-sum (deriv (addend expr) var)
                   (deriv (augend expr) var)))
        ; d(uv)/dx = (u * dv/dx) + (v * du/dx)
        ((product? expr)
         (make-sum
           (make-product
             (multiplier expr)
             (deriv (multiplicand expr) var))
           (make-product
             (deriv (multiplier expr) var)
             (multiplicand expr))))
        (else (error "unknown expression
                     type: DERIV" expr))))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list '+ a1 a2))))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0)
             (=number? m2 0))
         0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2))
         (* m1 m2))
        (else (list '* m1 m2))))
(define (=number? expr num)
  (and (number? expr) (= expr num)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))

; Multi-variable sums and products just modifying 'augend' and 'multiplicand'
(define (augend s)
  (define (rest expr)
    (if (null? (cdr expr))
        (car expr)
        (make-sum
          (car expr)
          (rest (cdr expr)))))
  (rest (cddr s)))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p)
  (define (rest expr)
    (if (null? (cdr expr))
        (car expr)
        (make-product
          (car expr)
          (rest (cdr expr)))))
  (rest (cddr p)))

; Another way to do this is to use 'accumulate'! What I built above is exactly
; what 'accumulate' does => it recursively applies 'make-sum' to the rest of the
; list
(define (augend s)
  (accumulate make-sum 0 (cddr s)))

(define (multiplicand s)
  (accumulate make-product 1 (cddr s)))

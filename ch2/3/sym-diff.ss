; Symbolic differentiation

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

; Representing algebraic expressions
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))
; Create sums and products
(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product m1 m2) (list '* m1 m2))

; A sum is a list whose first element is the symbol +
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s)) ; Second item of list
(define (augend s) (caddr s)) ; Third item of list

; A product is a list whose first element is the symbol *
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

(deriv '(+ x 3) 'x) ; (+ 1 0)
(deriv '(* x y) 'x) ; (+ (* x 0) (* 1 y))
(deriv '(* (* x y) (+ x 3)) 'x)
; (+ (* (* x y) (+ 1 0))
;    (* (+ (* x 0) (* 1 y))
;       (+ x 3)))

; Changing the implementation of 'make-sum' to simplify our answers
; Such that if both summands are numbers, 'make-sum' will add them and return
; their sum. If one of the summands is 0, then 'make-sum' will return the other
; summand
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list '+ a1 a2))))

; We define '=number?' to check if an expression is equal to a given number
(define (=number? expr num)
  (and (number? expr) (= expr num)))

; Similarly we change 'make-product' to build in the rules that 0 times anything
; is 0 and 1 times anything is the thing itself
(define (make-product m1 m2)
  (cond ((or (=number? m1 0)
             (=number? m2 0))
         0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2))
         (* m1 m2))
        (else (list '* m1 m2))))

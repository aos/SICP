; Exercise 2.58
; Infix operations

; Library functions
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
(define variable? symbol?)
(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))
(define (=number? expr num)
  (and (number? expr) (= expr num)))

; 1. With parenthesis
; (x + (3 * (x + (y + 2))))
; Define predicates, selectors, and constructors
(define (addend s) (car s))
(define (augend s) (caddr s))
(define (sum? expr)
  (and (pair? expr) (eq? (cadr expr) '+)))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list a1 '+ a2))))

(define (multiplier p) (car p))
(define (multiplicand p) (caddr p))
(define (product? expr)
  (and (pair? expr) (eq? (cadr expr) '*)))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0)
             (=number? m2 0))
         0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2))
         (* m1 m2))
        (else (list m1 '* m2))))

; 2. Without parenthesis and assumes correct order of operations:
; Parenthesis -> multiplication -> addition
; (x + 3 * (x + y + 2)) 
; Define predicates, selectors, and constructors
(define (sum? expr)
  (and (pair? expr)
       (memq '+ expr)))
(define (product? expr)
  (and (pair? expr)
       (not (sum? expr))
       (memq '* expr)))

(define (simple-sum? x)
  (null? (cdddr x)))

(define (augend s) (caddr s))
(define (multiplicand p) (caddr p))

; All expressions can be reduced to one of:
; 1. Sum expression:
; a.  (p +  q)        addend = p        augend = q
; b.  (p +  q +  r)   addend = p        augend = q + r
; c.  (p +  q *  r)   addend = p        augend = q * r
; d.  (p *  q +  r)   addend = p * q    augend = r
; e.  (p +  q ** r)   addend = p        augend = q ** r
; f.  (p ** q +  r)   addend = p ** q   augend = r

; a,b,c,e :   p + ...       => addend is always p
; for d:
;   algebraically: p * q + r = r + p * q = r + q * p
;   symbolically: let E = p * q + r = reverse E = r + q * p
; => The addend is the reversed augend of a reversed expression type c
; for f:
;   algebraically: p ** q + r = r + p ** q
;   symbolically: let E = p ** q + r = reverse E = r + q ** p
; => The addend is the reversed augend of a reversed expression type e
(define (addend s)
  (cond
    ; type a
    ((simple-sum? s) (car s))
    ; type b, c, e
    ((eq? '+ (cadr s)) (car s))
    ; type d, f
    (else (simplify-term (reverse (augend (reverse s)))))))

; a,b,c,e :   p + ...       => augend is the expression after the +
; for d:
;   algebraically: p * q + r = r + p * q = r + q * p
;   symbolically: let E = p * q + r = reverse E = r + q * p
; => the augend is the addend of a reversed expression type c
; for f:
;   algebraically: p ** q + r = r + p ** q = r + (p ** p)
;   symbolically: let E = p ** q + r = reverse E = r + q ** p
; => the augend is the addend of a reversed expression type e
(define (augend s)
  (cond
    ((simple-sum? s) (caddr x))
    ; a,b,c,e
    ((eq? '+ (cadr s)) (cddr s))
    ; d,f
    (else (addend (reverse s)))))

; Complex expression terms are allowed and can contain variables, constant, or
; sub-expressions which be a list of a single term
(define (simplify-term x)
  (cond ((variable? x) x)
        ((null? (cdr x)) (car x))
        (else x))) 

(define (simple-product? p)
  (null? (cdddr p)))

; 2. Product expressions
; a.  (p *  q)        multiplier = p        multiplicand = q
; b.  (p *  q *  r)   multiplier = p        multiplicand = q * r
; c.  (p *  q ** r)   multiplier = p        multiplicand = q ** r
; d.  (p ** q *  r)   multiplier = p ** q   multiplicand = r

; a,b,c : p * ... => multiplier always p
; for d :
;   algebraically: p ** q * r = r * p ** q
;   symbolically: let E = p ** q * r = reverse E = r * q ** p
; => the multiplier is the reversed multiplicand of a reversed expression type c
(define (multiplier p)
  (cond ((simple-product? p) (car p))
        ((eq? '* (cadr p)) (car p)) ; a,b,c
        (else (reverse (multiplicand (reverse p))))))

; a,b,c : p * ... => multiplicand is the expression after the *
; for d :
;   algebraically: p ** q * r = r * p ** q
;   symbolically: let E = p ** q * r = reverse E = r * q ** p
; => the multiplicand is the multiplier of the reversed expression type c
(define (multiplicand p)
  (cond ((simple-product? p) (caddr p))
        ((eq? '* (cadr p)) (cddr p))
        (else (multiplier (reverse p)))))

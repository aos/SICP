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
(define (variable? x) (symbol? x))
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
(define (augend s)
  (define (rest expr)
    (cond ((null? (cdr expr)) (car expr))
          ((pair? (caddr expr)) (rest (caddr expr)))
          ((product? expr)
           (make-product
             (car expr)
             (caddr expr)))
          ((sum? expr)
           (make-sum
             (car expr)
             (caddr expr))))) 
  (rest (cddr s)))

(define (multiplicand p)
  (define (rest expr)
    (cond ((null? (cdr expr)) (car expr))
          ((pair? (caddr expr)) (rest (caddr expr)))
          ((product? expr)
           (make-product
             (car expr)
             (caddr expr)))
          ((sum? expr)
           (make-sum
             (car expr)
             (caddr expr)))))
  (rest (cddr p)))

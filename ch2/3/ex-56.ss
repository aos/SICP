; Exercise 2.56
; Extend derivation to include exponentiation

; Library
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
        ((exponentiation? expr)
         (make-product
           (make-product
             (exponent expr)
             (make-exponentiation
               (base expr)
               (if (number? (exponent expr))
                   (- (exponent expr) 1)
                   '((- exponent expr) 1))))
           (deriv (base expr) var)))
        (else (error "unknown expression
                     type: DERIV" expr)))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

(define (=number? expr num)
  (and (number? expr) (= expr num)))

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

; Define 'exponentiation?' and selectors
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))
(define (base n) (cadr n))
(define (exponent n) (caddr n))

(define (make-exponentiation b e)
  (cond ((=number? b 1) 1)
        ((=number? e 1) b)
        ((=number? e 0) 1)
        (else
          (list '** b e))))

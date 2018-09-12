; Exercise 2.57
; Extend differentiation to handle sums and products of arbitrary numbers of
; variables

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

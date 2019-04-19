; Exercise 4.26
; 'unless' as a procedure

; Unless as a derived expression
((unless? exp) (eval (unless->if exp) env))

(define (unless? exp) (tagged-list? exp 'unless))
(define (unless-predicate exp) (cadr exp))
(define (unless-consequent exp)
  (if (not (null? (cdddr exp)))
      (cadddr exp)
      'false))
(define (unless-alt exp) (caddr exp))

(define (unless->if exp)
  (make-if (unless-predicate exp)
           (unless-consequent exp)
           (unless-alt exp)))

;; It might be good to have it as a procedure in the case of map or filter

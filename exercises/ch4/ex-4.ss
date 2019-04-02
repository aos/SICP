; Exercise 4.4
; 'and' && 'or'

(define (and? exp)
  (tagged-list? exp 'and))
(define (and-expressions exp) (cadr exp))
(define (first-expression exps) (car exps))
(define (rest-expressions exps) (cdr exps))
(define (and-eval-exps exps env)
  (cond ((null? exps) 'true)
        ((null? (rest-expressions exps))
         (eval (first-expression exps) env))
        ((true? (eval (first-expression exps) env))
         (and-eval-exps (rest-expressions exps) env))
        (else 'false)))

(and-eval-exps (and-expressions exp) env)

(define (or? exp)
  (tagged-list? exp 'or))
(define (or-expressions exp) (cadr exp))
(define (or-eval-exps exps env)
  (cond ((null? exps) 'false)
        ((true? (eval (first-expression exps) env)) 'true)
        (else
          (or-eval-exps (rest-expressions exps) env))))

(or-eval-exps (or-expressions exp) env)

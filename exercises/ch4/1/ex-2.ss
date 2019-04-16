; Exercise 4.2
; Re-order clauses for 'eval' such that procedure application appears before
; clause for assignments.

; 1. Since application comes before, it will assume we are applying the
; operator 'define on everything else. Since we loop back into (eval) with the
; exp being 'define, it will assume it's a variable as it is a symbol and
; attempt to retrieve its value.

; 2. Change syntax of evaluated language
(define (application? exp) (tagged-list? exp 'call))
(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))

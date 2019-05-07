; Amb evaluator

(define (amb? exp) (tagged-list? exp 'amb))
(define (amb-choices exp) (cdr exp))

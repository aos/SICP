; Exercise 4.9
; Design some iteration constructs!
; do, for, while, until

; (while (<predicate>)
;        <exp>)

(define (while? exp)
  (tagged-list? exp 'while))

(define (while-pred exp) (cadr exp))
(define (while-body exp) (cddr exp))
(define (make-while exp)
  (sequence->exp
    (list (list 'define
                (list 'iter)
                (make-if (while-pred exp)
                         (sequence->exp
                           (list (while-body exp)
                                 (list 'iter)))
                         'true)))))

;; Example:
(while (< x 5)
  (display x)
  (set! x (+ x 1)))

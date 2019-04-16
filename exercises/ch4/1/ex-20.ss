; Exercise 4.20
; Implement 'letrec' by transforming it into a 'let' expression

; 1. letrec->let
(define (letrec->let proc-body)
  (define (make-let def-list body)
    (list
      'let
      (map (lambda (d)
             (list (car d) '*unassigned*))
           def-list)
      (sequence->exp
        (append (map (lambda (d)
                       (list 'set! (car d) (cadr d)))
                     def-list)
                body))))
  (make-let
    (cadr proc-body)
    (caddr proc-body)))

; Example
(define (f x)
  (letrec
    ((even?
       (lambda (n)
         (if (= n 0)
             #t
             (odd? (- n 1)))))
     (odd?
       (lambda (n)
         (if (= n 0)
             #f
             (even? (- n 1))))))
    (<rest of f>)))

; Turns into:
(let ((even? '*unassigned*)
      (odd? '*unassigned*))
  (begin
    (set! even? (lambda (n)
                  (if (= n 0)
                      #t
                      (odd? (- n 1)))))
    (set! odd? (lambda (n)
                 (if (= n 0)
                     #f
                     (even? (- n 1)))))
    <rest of f>))

; 2. The problem with using just 'let' instead of 'letrec' is that:
;   a. the inits are evaluated in some unspecified order, so we can't guarantee
;   mutually recursive definitions 
;   b. 'let' is transformed to a lambda that is then called with the inits,
;   which are then evaluated and break in the case of mutually recursive
;   definitons. Where as with letrec --> the inits are '*unassigned*, then
;   assigned with set! as part of the expression

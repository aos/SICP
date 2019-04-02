; Exercise 4.5
; For 'cond' clauses, we have an additional syntax
; (<test> => <recipient>)
; if <test> evals to true, recipient is evaluated
; Recipient must be a procedure of one argument, this procedure is invoked
; on the value of <test>

(cond ((assoc 'b '((a 1) (b 2))) => cadr)
      (else #f))
; 2

(define (expand-clauses clauses env)
  (if (null? clauses)
      'false ; no else clause
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (cond-else-clause? first)
            (if (null? rest)
                (sequence->exp
                  (cond-actions first))
                (error "ELSE clauses isn't
                        last: COND->IF"
                        clauses))
        (if (eq? (car (cond-actions first)) '=>)
            (make-if (cond-predicate first)
                     (list (cadr (cond-actions first))
                           (cond-predicate first))
                     (expand-clauses
                      rest
                      env))
            (make-if (cond-predicate first)
                     (cond-actions first)
                     (expand-clauses
                       rest
                       env)))))))

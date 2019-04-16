; Exercise 4.3
; Rewrite 'eval' so that the dispatch is done in a data-directed style

(define (eval exp env)
  (cond ((self-evaluating? exp)
         exp)
        ((variable? exp)
         (lookup-variable-value exp env))
        (else
          ((get 'eval (car exp)) (cdr exp) env))))

(define (install-eval-package)
  ;; internal procedures
  (define (sequence->exp seq)
    (cond ((null? seq) seq)
          ((last-exp? seq) (first-exp seq))
          (else (make-begin seq))))
  (define (make-begin seq) (cons 'begin seq))
  (define (cond-clauses exp) (cdr exp))
  (define (cond-else-clause? clause)
    (eq? (cond-predicate clause) 'else))
  (define (cond-predicate clause) (car clause))
  (define (cond-actions clause) (cdr clause))
  (define (cond->if exp)
    (expand-clauses (cond-clauses exp)))
  (define (expand-clauses clauses)
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
          (make-if (cond-predicate first)
                  (sequence->exp
                    (cond-actions first))
                  (expand-clauses
                    rest))))))

  (put 'eval 'quote
       (lambda (exp env)
         (cadr exp)))
  (put 'eval 'assignment
       (lambda (exp env)
         (eval-assignment exp env)))
  (put 'eval 'definition
       (lambda (exp env)
          (eval-definition exp env)))
  (put 'eval 'if
       (lambda (exp env)
          (eval-if exp env)))
  (put 'eval 'lambda
       (lambda (exp env)
         ((get 'eval 'make-procedure)
          (cadr exp)
          (cddr exp)
          env)))
  (put 'eval 'begin
       (lambda (exp env)
         (eval-sequence (cdr exp) env)))
  (put 'eval 'cond
       (lambda (exp env)
         (get 'eval (cond->if exp) env)))
  (put 'eval 'application
       (lambda (exp env)
         (apply (get 'eval (car exp) env)
                (list-of-values
                  (operands exp)
                  env)))))

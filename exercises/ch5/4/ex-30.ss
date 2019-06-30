; Exercise 5.30
; Error handling

; 1. Catching variable value lookup
; This must also be done for set-variable-value! and define-variable!
; If we use the changes in exercise 4.12 then we don't have to
; duplicate the work since all the work is abstracted away
(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop
               (enclosing-environment env)))
            ((eq? var (car vars))
             (cons '*bound* (car vals)))
            (else (scan (cdr vars)
                        (cdr vals)))))
    (if (eq? env the-empty-environment)
        (cons '*unbound* var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

(define (var-value var) (cdr var))
(define (var-bind-type var) (car var))
(define (unbound-var? var)
  (eq? (var-bind-type var) '*unbound*))

;; Add this to ev-variable
;   (test (op unbound-var?) (reg val))
;   (branch (label unbound-variable-error))

; 2. safe-car-cdr
(define (safe-car-cdr proc args)
  (if (not (pair? args))
      (list '*primitive-error* x)
      (apply-in-underlying-scheme proc args)))

(define (apply-primitive-procedure proc args)
  (let ((primitive (primitive-implementation proc)))
    (if (or (equal? primitive 'car)
            (equal? primitive 'cdr))
        (safe-car-cdr proc args)
        (apply-in-underlying-scheme proc args))))

(define (primitive-error? val)
  (and (symbol? (car val))
       (eq? (car val) '*primitive-error*)))

;; Add this to primitive-apply
;   (test (op primitive-error?) (reg val))
;   (branch (label primitive-error))

;; Add this to evaluator (perf in error section)
;
; unbound-variable
;   (restore continue)
;   (assign val
;           (const unbound-variable))
;   (goto (label signal-error))
; primitive-error
;   (restore continue)
;   (goto (label signal-error))

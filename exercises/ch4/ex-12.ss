; Exercise 4.12
; Abstract away the common parts of:
; define-variable!, set-variable-value!, lookup-variable-value

(define (env-loop var val env action)
  (define (scan vars vals)
    (cond ((and (eq? env the-empty-environment)
                (or (eq? action 'lookup-var)
                    (eq? action 'set-var!)))
           (error "Undefined variable" var))
          ((null? vars)
           (if (or (eq? action 'lookup-var)
                   (eq? action 'set-var!))
               (env-loop
                 var
                 val
                 (enclosing-environment env)
                 action)
               (add-binding-to-frame!
                 var val (first-frame env))))
          ((eq? var (car vars))
           (if (or (eq? action 'define-var)
                   (eq? action 'set-var!))
               (set-car! vals val)
               (car vals)))
          (else (scan (cdr vars)
                      (cdr vals)))))
  (let ((frame (first-frame env)))
    (scan (frame-variables frame)
          (frame-values frame))))

(define (lookup-variable-value var env)
  (env-loop var '() env 'lookup-var))

(define (set-variable-value! var val env)
  (env-loop var val env 'set-var!))

(define (define-variable! var val env)
  (env-loop var val env 'define-var))

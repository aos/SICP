; Amb evaluator

(define (amb? exp) (tagged-list? exp 'amb))
(define (amb-choices exp) (cdr exp))

(define (analyze exp)
  (cond ((amb? exp)
         (analyze-amb exp))
        ((self-evaluating? exp)
         (analyze-self-evaluating exp))
        ((variable? exp)
         (analyze-variable exp))
        ((quoted? exp)
         (analyze-quoted exp))
        ((assignment? exp)
         (analyze-assignment exp))
        ((definition? exp)
         (analyze-definition exp))
        ((let? exp)
         (analyze (let->combination exp)))
        ((if? exp)
         (analyze-if exp))
        ((lambda? exp)
         (analyze-lambda exp))
        ((begin? exp)
         (analyze-sequence
           (begin-actions exp)))
        ((cond? exp)
         (analyze (cond->if exp)))
        ((application? exp)
         (analyze-application exp))
        (else
          (error "Unknown expression
                 type: ANALYZE"
                 exp))))

(define (ambeval exp env succeed fail)
  ((analyze exp) env succeed fail))

; Execution procedures
(define (analyze-self-evaluating exp)
  (lambda (env succeed fail)
    (succeed exp fail)))

(define (analyze-quoted exp)
  (let ((qval (text-of-quotation exp)))
    (lambda (env succeed fail)
      (succeed qval fail))))

(define (analyze-variable exp)
  (lambda (env succeed fail)
    (succeed (lookup-variable-value exp env)
             fail)))

(define (analyze-lambda exp)
  (let ((vars (lambda-parameters exp))
        (bproc (analyze-sequence
                 (lambda-body exp))))
    (lambda (env succeed fail)
      (succeed (make-procedure vars bproc env)
               fail))))

(define (analyze-if exp)
  (let ((pproc (analyze (if-predicate exp)))
        (cproc (analyze (if-consequent exp)))
        (aproc (analyze (if-alternative exp))))
    (lambda (env succeed fail)
      (pproc env
             ;; success continuation for evaluating
             ;; the predicate to obtain pred-value
             (lambda (pred-value fail2)
               (if (true? pred-value)
                   (cproc env succeed fail2)
                   (aproc env succeed fail2)))
             ;; failure continuation for evaluating
             ;; the predicate
             fail))))

(define (analyze-sequence exps)
  (define (sequentially a b)
    (lambda (env succeed fail)
      (a env
         ;; success continuation for calling a
         (lambda (a-value fail2)
           (b env succeed fail2))
         ;; failure continuation for calling a
         fail)))
  (define (loop first-proc rest-procs)
    (if (null? rest-procs)
        first-proc
        (loop (sequentially first-proc
                            (car rest-procs))
              (cdr rest-procs))))
  (let ((procs (map analyze exps)))
    (if (null? procs)
        (error "Empty sequence: ANALYZE"))
    (loop (car procs) (cdr procs))))

(define (analyze-definition exp)
  (let ((var (definition-variable exp))
        (vproc (analyze
                 (definition-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)
               (define-variable! var val env)
               (succeed 'ok fail2))
             fail))))

(define (analyze-assignment exp)
  (let ((var (assignment-variable exp))
        (vproc (analyze
                 (assignment-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)  ; *1*
               (let ((old-value
                       (lookup-variable-value
                         var
                         env)))
                 (set-variable-value!
                   var
                   val
                   env)
                 (succeed
                   'ok
                   (lambda ()     ; *2*
                     (set-variable-value!
                       var
                       old-value
                       env)
                     (fail2)))))
             fail))))

(define (analyze-application exp)
  (let ((fproc (analyze (operator exp)))
        (aprocs (map analyze (operands exp))))
    (lambda (env succeed fail)
      (fproc env
             (lambda (proc fail2)
               (get-args
                 aprocs
                 env
                 (lambda (args fail3)
                   (execute-application
                     proc args succeed fail3))
                 fail2))
             fail))))

(define (get-args aprocs env succeed fail)
  (if (null? aprocs)
      (succeed '() fail)
      ((car aprocs)
       env
       ;; success continuation for this aproc
       (lambda (arg fail2)
         (bkpt 'get-args)
         (get-args
           (cdr aprocs)
           env
           ;; success continuation for recursive
           ;; call to get-args
           (lambda (args fail3)
             (bkpt 'success-in-recursion)
             (succeed (cons arg args)
                      fail3))
           fail2))
       fail)))

(define (execute-application
          proc args succeed fail)
  (cond ((primitive-procedure? proc)
         (bkpt 'execute-application)
         (succeed
           (apply-primitive-procedure
             proc args)
           fail))
        ((compound-procedure? proc)
         ((procedure-body proc)
          (extend-environment
            (procedure-parameters proc)
            args
            (procedure-environment proc))
          succeed
          fail))
        (else (error "Unknown procedure type:
                      EXECUTE-APPLICATION"
                      proc))))

(define (analyze-amb exp)
  (let ((cprocs
          (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (bkpt 'analyze-amb)
      (define (try-next choices)
        (if (null? choices)
            (fail)
            ((car choices)
             env
             succeed
             (lambda ()
               (try-next (cdr choices))))))
      (try-next cprocs))))

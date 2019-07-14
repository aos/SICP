; Exercise 5.40
; Add compile-time environment

; Example compile-time environment
'((y z) ; <-- inner-most frame
  (a b c d e)
  (x y)) ; <-- outer-most frame

; Extends the compile-time environment on compiling the lambda body
(define (extend-compile-environment params base-env)
  (cons params base-env))

(define (compile-lambda-body exp proc-entry compile-env)
  (let ((formals (lambda-parameters exp)))
    (append-instruction-sequences
      (make-instruction-sequence
        '(env proc argl)
        '(env)
        `(,proc-entry
           (assign env
                   (op compiled-procedure-env)
                   (reg proc))
           (assign env
                   ; add extending compile-time environment
                   (op extend-environment)
                   (const ,formals)
                   (reg argl)
                   (reg env))))
      (compile-sequence (lambda-body exp) 'val 'return
                        (extend-compile-environment formals
                                                    compile-env)))))

(define (compile-lambda exp target linkage compile-env)
  (let ((proc-entry
          (make-label 'entry))
        (after-lambda
          (make-label 'after-lambda)))
    (let ((lambda-linkage
            (if (eq? linkage 'next)
                after-lambda
                linkage)))
      (append-instruction-sequences
        (tack-on-instruction-sequence
          (end-with-linkage
            lambda-linkage
            (make-instruction-sequence
              '(env)
              (list target)
              `((assign
                  ,target
                  (op make-compiled-procedure)
                  (label ,proc-entry)
                  (reg env)))))
          (compile-lambda-body exp proc-entry compile-env))
        after-lambda))))

(define (compile exp target linkage compile-env)
  (cond ((self-evaluating? exp)
         (compile-self-evaluating
           exp target linkage))
        ((quoted? exp)
         (compile-quoted exp target linkage))
        ((variable? exp)
         (compile-variable exp target linkage compile-env))
        ((assignment? exp)
         (compile-assignment exp target linkage compile-env))
        ((definition? exp)
         (compile-definition exp target linkage))
        ((if? exp)
         (compile-if exp target linkage))
        ((lambda? exp)
         (compile-lambda exp target linkage compile-env))
        ((begin? exp)
         (compile-sequence
           (begin-actions exp) target linkage compile-env))
        ((cond? exp)
         (compile
           (cond->if exp) target linkage))
        ((application? exp)
         (compile-application
           exp target linkage compile-env))
        (else
          (error "Unknown expression type: COMPILE"
                 exp))))

(define (compile-sequence seq target linkage compile-env)
  (if (last-exp? seq)
      (compile (first-exp seq) target linkage compile-env)
      (preserving '(env continue)
        (compile (first-exp seq) target 'next compile-env)
        (compile-sequence (rest-exps seq)
                          target linkage compile-env))))

(define (compile-application
          exp target linkage compile-env)
  (let ((proc-code
          (compile (operator exp) 'proc 'next compile-env))
        (operand-codes
          (map (lambda (operand)
                 (compile operand 'val 'next compile-env))
               (operands exp))))
    (preserving
      '(env continue)
      proc-code
      (preserving
        '(proc continue)
        (construct-arglist operand-codes)
        (compile-procedure-call
          target linkage)))))

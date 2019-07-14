; Compiling Expressions

;; Linkage code
(define (compile-linkage linkage)
  (cond ((eq? linkage 'return)
         (make-instruction-sequence
           '(continue)
           '()
           '((goto (reg continue)))))
        ((eq? linkage 'next)
         (empty-instruction-sequence))
        (else
          (make-instruction-sequence '() '()
            `((goto (label ,linkage)))))))

;; Appended to an instruction sequence
; by preserving the continue register
(define (end-with-linkage
          linkage instruction-sequence)
  (preserving '(continue)
              instruction-sequence
              (compile-linkage linkage)))

; Compiling simple expressions
(define (compile-self-evaluating
          exp target linkage)
  (end-with-linkage
    linkage (make-instruction-sequence
              '()
              (list target)
              `((assign ,target (const ,exp))))))

(define (compile-quoted exp target linkage)
  (end-with-linkage
    linkage
    (make-instruction-sequence
      '()
      (list target)
      `((assign
          ,target
          (const ,(text-of-quotation exp)))))))

(define (compile-variable
          exp target linkage)
  (end-with-linkage
    linkage
    (make-instruction-sequence
      '(env)
      (list target)
      `((assign ,target
                (op lookup-variable-value)
                (const ,exp)
                (reg env))))))

(define (compile-assignment
          exp target linkage)
  (let ((var (assignment-variable exp))
        (get-value-code
          (compile (assignment-value exp)
                   'val
                   'next)))
    (end-with-linkage
      linkage
      (preserving
        '(env)
        get-value-code
        (make-instruction-sequence
          '(env val)
          (list target)
          `((perform (op set-variable-value!)
                     (const ,var)
                     (reg val)
                     (reg env))
            (assign ,target (const ok))))))))

(define (compile-definition
          exp target linkage)
  (let ((var (definition-variable exp))
        (get-value-code
          (compile (definition-value exp)
                   'val
                   'next)))
    (end-with-linkage
      linkage
      (preserving
        '(env)
        get-value-code
        (make-instruction-sequence
          '(env val)
          (list target)
          `((perform (op define-variable!)
                     (const ,var)
                     (reg val)
                     (reg env))
            (assign ,target (const ok))))))))

;; predicates
; Generate label
(define label-counter 0)
(define (new-label-number)
  (set! label-counter (+ 1 label-counter))
  label-counter)
(define (make-label name)
  (string->symbol
    (string-append
      (symbol->string name)
      (number->string (new-label-number)))))

(define (compile-if exp target linkage)
  (let ((t-branch (make-label 'true-branch))
        (f-branch (make-label 'false-branch))
        (after-if (make-label 'after-if)))
    (let ((consequent-linkage
            (if (eq? linkage 'next)
                after-if
                linkage)))
      (let ((p-code
              (compile (if-predicate exp)
                       'val
                       'next))
            (c-code
              (compile (if-consequent exp)
                       target
                       consequent-linkage))
            (a-code
              (compile (if-alternative exp)
                       target
                       linkage)))
        (preserving
          '(env continue)
          p-code
          (append-instruction-sequences
            (make-instruction-sequence
              '(val)
              '()
              `((test (op false?) (reg val))
                (branch (label ,f-branch))))
            (parallel-instruction-sequences
              (append-instruction-sequences
                t-branch c-code)
              (append-instruction-sequences
                f-branch a-code))
            after-if))))))

;; sequences
(define (compile-sequence seq target linkage)
  (if (last-exp? seq)
      (compile (first-exp seq) target linkage)
      (preserving '(env continue)
        (compile (first-exp seq) target 'next)
        (compile-sequence (rest-exps seq)
                          target linkage))))

;; lambda
(define (make-compiled-procedure entry env)
  (list 'compiled-procedure entry env))
(define (compiled-procedure? proc)
  (tagged-list? proc 'compiled-procedure))
(define (compiled-procedure-entry c-proc)
  (cadr c-proc))
(define (compiled-procedure-env c-proc)
  (caddr c-proc))

(define (compile-lambda exp target linkage)
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
          (compile-lambda-body exp proc-entry))
        after-lambda))))

(define (compile-lambda-body exp proc-entry)
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
                   (op extend-environment)
                   (const ,formals)
                   (reg argl)
                   (reg env))))
      (compile-sequence (lambda-body exp)
                        'val
                        'return))))

;; application (combination)
(define (compile-application
          exp target linkage)
  (let ((proc-code
          (compile (operator exp) 'proc 'next))
        (operand-codes
          (map (lambda (operand)
                 (compile operand 'val 'next))
               (operands exp))))
    (preserving
      '(env continue)
      proc-code
      (preserving
        '(proc continue)
        (construct-arglist operand-codes)
        (compile-procedure-call
          target linkage)))))

(define (construct-arglist operand-codes)
  (let ((operand-codes
          (reverse operand-codes)))
    (if (null? operand-codes)
        (make-instruction-sequence
          '()
          '(argl)
          '((assign argl (const ()))))
        (let ((code-to-get-last-arg
                (append-instruction-sequences
                  (car operand-codes)
                  (make-instruction-sequence
                    '(val)
                    '(argl)
                    '((assign argl
                              (op list)
                              (reg val)))))))
          (if (null? (cdr operand-codes))
              code-to-get-last-arg
              (preserving
                '(env)
                code-to-get-last-arg
                (code-to-get-rest-args
                  (cdr operand-codes))))))))

(define (code-to-get-rest-args operand-codes)
  (let ((code-for-next-arg
          (preserving
            '(argl)
            (car operand-codes)
            (make-instruction-sequence
              '(val argl)
              '(argl)
              '((assign argl
                        (op cons)
                        (reg val)
                        (reg argl)))))))
    (if (null? (cdr operand-codes))
        code-for-next-arg
        (preserving
          '(env)
          code-for-next-arg
          (code-to-get-rest-args
            (cdr operand-codes))))))

;; procedure application
(define (compile-procedure-call target linkage)
  (let ((primitive-branch
          (make-label 'primitive-branch))
        (compiled-branch
          (make-label 'compiled-branch))
        (after-call
          (make-label 'after-call)))
    (let ((compiled-linkage
            (if (eq? linkage 'next)
                after-call
                linkage)))
      (append-instruction-sequences
        (make-instruction-sequence
          '(proc)
          '()
          `((test
              (op primitive-procedure?)
              (reg proc))
            (branch
              (label ,primitive-branch))))
        (parallel-instruction-sequences
          (append-instruction-sequences
            compiled-branch
            (compile-proc-appl
              target
              compiled-linkage))
          (append-instruction-sequences
            primitive-branch
            (end-with-linkage
              linkage
              (make-instruction-sequence
                '(proc argl)
                (list target)
                `((assign
                    ,target
                    (op apply-primitive-procedure)
                    (reg proc)
                    (reg argl)))))))
        after-call))))

; compile-proc-appl
(define all-regs '(env proc val argl continue))

(define (compile-proc-appl target linkage)
  (cond ((and (eq? target 'val)
              (not (eq? linkage 'return)))
         (make-instruction-sequence
           '(proc)
           all-regs
           `((assign continue (label ,linkage))
             (assign
               val
               (op compiled-procedure-entry)
               (reg proc))
             (goto (reg val)))))
        ((and (not (eq? target 'val))
              (not (eq? linkage 'return)))
         (let ((proc-return
                 (make-label 'proc-return)))
           (make-instruction-sequence
             '(proc)
             all-regs
             `((assign continue
                       (label ,proc-return))
               (assign
                 val
                 (op compiled-procedure-entry)
                 (reg proc))
               ,proc-return
               (assign ,target (reg val))
               (goto (label ,linkage))))))
        ((and (eq? target 'val)
              (eq? linkage 'return))
         (make-instruction-sequence
           '(proc continue)
           all-regs
           '((assign
               val
               (op compiled-procedure-entry)
               (reg proc))
             (goto (reg val)))))
        ((and (not (eq? target 'val))
              (eq? linkage 'return))
         (error "return linkage, target not val: COMPILE"
                target))))

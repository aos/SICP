; '(define (factorial n)
;    (define (iter product counter)
;      (if (> counter n)
;          product
;          (iter (* counter product)
;                (+ counter 1))))
;    (iter 1 1))

((env)
 (val)
 ((assign val (op make-compiled-procedure) (label entry2) (reg env))
  (goto (label after-lambda1))
; body of (factorial n) -> (lambda (n) ...)
entry2
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (n)) (reg argl) (reg env))
; (define (iter product counter) ...)
; body of above: (lambda (product counter) ...)
  (assign val (op make-compiled-procedure) (label entry7) (reg env))
  (goto (label after-lambda6))
entry7
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (product counter)) (reg argl) (reg env))
; compile-if
  (save continue)
  (save env)
; (> counter n)
  (assign proc (op lookup-variable-value) (const >) (reg env))
  (assign val (op lookup-variable-value) (const n) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const counter) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch22))
compiled-branch21
  (assign continue (label after-call20))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch22
; apply (> counter n)
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call20
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch9))
true-branch10
  (assign val (op lookup-variable-value) (const product) (reg env))
  (goto (reg continue))
; (iter (* counter product) (+ counter 1))
false-branch9
  (assign proc (op lookup-variable-value) (const iter) (reg env))
  (save continue)
; save (iter) in proc register
  (save proc)
  (save env)
; (+ counter 1)
  (assign proc (op lookup-variable-value) (const +) (reg env))
  (assign val (const 1))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const counter) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch16))
compiled-branch15
  (assign continue (label after-call14))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch16
; apply (+ counter 1)
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call14
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
; (* counter product)
  (assign proc (op lookup-variable-value) (const *) (reg env))
  (assign val (op lookup-variable-value) (const product) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const counter) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch13))
compiled-branch12
  (assign continue (label after-call11))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch13
; apply (* counter product)
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call11
  (restore argl)
; argl contains (* counter product) and (+ counter 1)
  (assign argl (op cons) (reg val) (reg argl))
; proc contains iter
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch19))
compiled-branch18
  (assign val (op compiled-procedure-entry) (reg proc))
; return to next iter
; We don't need to save the continue here, just recurse
  (goto (reg val))
primitive-branch19
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call17
after-if8
; (define (iter product counter) ...)
after-lambda6
  (perform (op define-variable!) (const iter) (reg val) (reg env))
  (assign val (const ok))
  (assign proc (op lookup-variable-value) (const iter) (reg env))
; (iter 1 1)
  (assign val (const 1))
  (assign argl (op list) (reg val))
  (assign val (const 1))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch5))
compiled-branch4
; entry7 -> apply (iter 1 1)
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch5
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call3
after-lambda1
; (define (factorial n) ...)
  (perform (op define-variable!) (const factorial) (reg val) (reg env))
  (assign val (const ok))))

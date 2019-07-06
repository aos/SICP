; (define (factorial n)
;   (if (= n 1)
;       1
;       (* n (factorial (- n 1)))))

((env)
 (val)
; compile-lambda
 ((assign val (op make-compiled-procedure) (label entry2) (reg env))
  (goto (label after-lambda1))
; compile-lambda-body
entry2
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (n)) (reg argl) (reg env))
; compile-if
  (save continue)
  (save env)
; compute (= n 1)
  (assign proc (op lookup-variable-value) (const =) (reg env))
  (assign val (const 1))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const n) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch17))
compiled-branch16
  (assign continue (label after-call15))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch17
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
; (= n 1)
after-call15
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch4))
; 1
true-branch5
  (assign val (const 1))
  (goto (reg continue))
; (* n (factorial (- n 1)))
false-branch4
  (assign proc (op lookup-variable-value) (const *) (reg env))
  (save continue)
; save * procedure
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const factorial) (reg env))
; save factorial procedure
  (save proc)
; compute (- n 1)
  (assign proc (op lookup-variable-value) (const -) (reg env))
  (assign val (const 1))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const n) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch8))
compiled-branch7
  (assign continue (label after-call6))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
; apply (- n 1)
primitive-branch8
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call6
; (- n 1)
  (assign argl (op list) (reg val))
; restore factorial
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch11))
; apply factorial
compiled-branch10
; We save the continue here so that we can restore into it
  (assign continue (label after-call9))
; entry2 -> we recurse into (factorial (- n 1)) here
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch11
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call9
; val contains result of (factorial (- n 1))
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lookup-variable-value) (const n) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
; restore *
  (restore proc)
  (restore continue)
; apply * and return its value
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch14))
compiled-branch13
; tail recursion here (we don't re-assign continue)
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch14
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call12
after-if3
after-lambda1
  (perform (op define-variable!) (const factorial) (reg val) (reg env))
  (assign val (const ok))))

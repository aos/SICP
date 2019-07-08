; The correct open-code compilation

((env)
 (val)
 ((assign val (op make-compiled-procedure) (label entry2) (reg env))
  (goto (label after-lambda1))
entry2
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (x y)) (reg argl) (reg env))
  (assign arg1 (op lookup-variable-value) (const x) (reg env))
  ; x is saved in arg1
  (save arg1)
  (assign arg1 (const 1))
  (assign arg2 (op lookup-variable-value) (const y) (reg env))
  ; application of (- 1 y) in arg2
  (assign arg2 (op -) (reg arg1) (reg arg2))
  ; restore x
  (restore arg1)
  ; application of (+ x (- 1 y))
  (assign val (op +) (reg arg1) (reg arg2))
  (goto (reg continue))
after-lambda1
  (perform (op define-variable!) (const f) (reg val) (reg env))
  (assign val (const ok))))

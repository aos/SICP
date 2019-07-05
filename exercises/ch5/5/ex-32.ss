; Exercise 5.32

; 1.
ev-application
  (save continue)
  (save unev)
  (assign unev (op operands) (reg exp))
  (assign exp (op operator) (reg exp))
  (test (op symbol?) (reg exp)) ; test for symbol
  (branch (label ev-appl-operator-symbol)) ; don't save
  (save env) ; save in case the operator is not a symbol
  (assign
    continue (label ev-appl-did-operator))
  (goto (label eval-dispatch))

ev-appl-did-operator
  (restore env)

ev-appl-operator-symbol
  (restore unev)            ; operands
  (assign argl (op empty-arglist))
  (assign proc (reg val))   ; operator
  (test (op no-operands?) (reg unev))
  (branch (label apply-dispatch))
  (save proc)

; 2. It won't get the advantage of compilation -- such as not having to
; interpret the command on each run.

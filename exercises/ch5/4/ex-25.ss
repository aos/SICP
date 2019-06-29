; Exercise 5.25
; Normal-order evaluation
; Note: I'm cheating here and using 'delay-it' and 'force-it' as if they were
; primitives. It's possible to decompose 'delay-it' and 'force-it' into
; constituent primitives and would essentially just be (a lot) more branches

ev-appl-did-operator
  (restore unev)
  (restore env)
  (assign argl (op empty-arglist))
  (assign proc              ; force operator
          (op force-it)
          (reg val))
  (test (op no-operands?) (reg unev))
  (branch (label apply-dispatch))
  (save proc)

; we default to delaying the args (if any)
ev-delay-args
  (assign exp
          (op first-operand)
          (reg unev))
  (test (op no-operands?) (reg unev))
  (branch (label apply-dispatch))
  (assign exp
          (op delay-it)
          (reg exp)
          (reg env))
  (assign unev
          (op rest-operands)
          (reg unev))
  (assign argl
          (op adjoin-arg)
          (reg exp)
          (reg argl))
  (goto (label ev-delay-args))

; we force the args if we're doing primitive-apply
; No changes to the start of our operand loop
; We evaluate the expression here and pass it on
; to be forced in 'ev-appl-accumulate-arg'
ev-appl-operand-loop
  (save argl)
  (assign exp
          (op first-operand)
          (reg unev))
  (test (op last-operand?) (reg unev))
  (branch (label ev-appl-last-arg))
  (save env)
  (save unev)
  (assign continue
          (label ev-appl-accumulate-arg))
  (goto (label eval-dispatch))

ev-appl-accumulate-arg
  (restore unev)
  (restore env)
  (restore argl)
  ; we force each argument value one by one
  ; and add it to our (new) arglist
  (assign val
          (op force-it)
          (reg val)
          (reg env))
  (assign argl
          (op adjoin-arg)
          (reg val)
          (reg argl))
  (assign unev
          (op rest-operands)
          (reg unev))
  (goto (label ev-appl-operand-loop))

; No change here, this is similar to 'ev-appl-operand-loop'
; We're retaining tail-call optimization
ev-appl-last-arg
  (assign continue
          (label ev-appl-accum-last-arg))
  (goto (label eval-dispatch))

; Similar to 'ev-appl-accumulate-arg'
ev-appl-accum-last-arg
  (restore argl)
  (assign val
          (op force-it)
          (reg val)
          (reg env))
  (assign argl
          (op adjoin-arg)
          (reg val)
          (reg argl))
  (restore proc)
  (goto (label primitive-apply))

apply-dispatch
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-apply-init)) ;; new start point
  (test (op compound-procedure?) (reg proc))
  (branch (label compound-apply))
  (goto (label unknown-procedure-type))

primitive-apply-init
  (assign unev (reg argl)) ; arglist is now unevaluated
  (assign argl (op empty-arglist)) ; empty out argl
  (goto (label ev-appl-operand-loop))

; No change here
; At this point all of our arguments in argl have been forced
primitive-apply
  (assign val (op apply-primitive-procedure)
              (reg proc)
              (reg argl))
  (restore continue)
  (goto (reg continue))

; No change here
compound-apply
  (assign unev
          (op procedure-parameters)
          (reg proc))
  (assign env
          (op procedure-environment)
          (reg proc))
  (assign env
          (op extend-environment)
          (reg unev)
          (reg argl)
          (reg env))
  (assign unev
          (op procedure-body)
          (reg proc))
  (goto (label ev-sequence))

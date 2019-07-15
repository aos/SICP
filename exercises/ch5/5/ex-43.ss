; Exercise 5.43
; Modify the compiler to scan out internal defiinitions
; before compiling a procedure body

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
      ; Just call 'scan-out-defines' on the lambda body
      (compile-sequence (scan-out-defines (lambda-body exp))
                        'val
                        'return))))

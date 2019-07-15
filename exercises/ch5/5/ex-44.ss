; Exercise 5.44
; Modify open-coding compiler to use compile-time env

(define (make-open-code-insts op operands target linkage compile-env)
  (let ((first-operand-code
          (compile (car operands) 'arg1 'next compile-env))
        (second-operand-code
          (compile (cadr operands) 'arg2 'next compile-env)))
    (end-with-linkage
      linkage
      (append-instruction-sequences
        first-operand-code
        (preserving
          '(arg1)
          second-operand-code
          (make-instruction-sequence
            '(arg1 arg2)
            (list target)
            `((assign ,target
                      (op ,op)
                      (reg arg1)
                      (reg arg2)))))))))

(define (compile-open-code exp target linkage compile-env)
  (let ((op (operator exp))
        (args (operands exp)))
    ; We check to see if operator exists in our compile-time env
    ; if so -- we skip open-coding it and go straight to application
    (let ((op-addr (find-variable op
                                  compile-env)))
      (cond ((pair? op-addr)
             (compile-application exp target linkage compile-env))
            ((or (eq? op '=)
                 (eq? op '-))
             (make-open-code-insts op
                                   args
                                   target
                                   linkage
                                   compile-env))
            (else
              (make-open-code-insts op
                                    (construct-operands op
                                                        args)
                                    target
                                    linkage
                                    compile-env))))))

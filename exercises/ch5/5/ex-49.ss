; Exercise 5.49
; Read-compile-execute-print loop
; Aka - compiling interpreter

(load "ex-49-utils.ss")

(define (compile-and-assemble expr)
  (assemble
    (statements
      (compile expr 'val 'return))
    rcex-machine))

(define rcex-machine
  (make-machine

    (cons (list 'compile-and-assemble
                compile-and-assemble)
          eceval-operations)

    '(read-eval-print-loop
       (perform (op initialize-stack))
       (perform (op prompt-for-input)
                (const ";;; RCEX input:"))
       (assign exp (op read))
       (assign env (op get-global-environment))
       (assign continue (label print-result))
       (goto (label compile-execute))
       
      print-result
        (perform (op print-stack-statistics))
        (perform (op announce-output)
                 (const ";;; RCEX value:"))
        (perform (op user-print) (reg val))
        (goto (label read-eval-print-loop))
        
      compile-execute
        (assign val (op compile-and-assemble) (reg exp))
        (goto (reg val)))))

(define (start-rcex)
  (set! the-global-environment
    (setup-environment))
  (start rcex-machine))

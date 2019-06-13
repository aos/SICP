; Exercise 5.7
; Create an exponentiation machine

(define expt-machine
  (make-machine
    '(b n continue val)
    (list (list '= =)
          (list '- -)
          (list '* *))
    '(controller
        (assign continue (label expt-done))

      expt-loop
        (test (op =) (reg n) (const 0))
        (branch (label base-case))
        (save continue)
        (assign n (op -) (reg n) (const 1))
        (assign continue (label after-expt))
        (goto (label expt-loop))

      after-expt
        (restore continue)
        (assign val (op *) (reg b) (reg val))
        (goto (reg continue))

      base-case
        (assign val (const 1))
        (goto (reg continue))

      expt-done)))

(set-register-contents! expt-machine 'b 10)
(set-register-contents! expt-machine 'n 2)

(start expt-machine)

(get-register-contents expt-machine 'val)

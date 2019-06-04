; Exercise 5.7

(define expt-machine
  '(b n continue val)
  (list (list '= =)
        (list '- -)
        (list '* *)
        (list 'read read)
        (list 'print print))
  '(controller
     (assign b (op read))
     (assign n (op read))
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

    expt-done
     (perform (op print) (reg val))))

(start expt-machine)
(get-register-contents expt-machine 'val)

; Recursive fact-machine (using a stack)

(define fact-machine
  (make-machine
    '(n continue val)

    (list (list '= =)
          (list '* *)
          (list '- -)
          (list 'read read)
          (list 'print write-line))

    '(controller
        (assign n (op read))
        (assign continue (label fact-done))

      fact-loop
        (test (op =) (reg n) (const 1))
        (branch (label base-case))
        (save continue)
        (save n)
        (assign n (op -) (reg n) (const 1))
        (assign continue (label after-fact))
        (goto (label fact-loop))

      after-fact
        (restore n)
        (restore continue)
        (assign val (op *) (reg n) (reg val))
        (goto (reg continue))

      base-case
        (assign val (const 1))
        (goto (reg continue))

      fact-done
        (perform (op print-stack-statistics))
        (perform (op print) (reg val))
        (goto (label controller)))))

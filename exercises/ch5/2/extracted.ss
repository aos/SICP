; Sample output from extract labels from exercise 5.7

; Instructions:
'(((assign continue (label expt-done)))
  ((test (op =) (reg n) (const 0)))
  ((branch (label base-case)))
  ((save continue))
  ((assign n (op -) (reg n) (const 1)))
  ((assign continue (label after-expt)))
  ((goto (label expt-loop)))
  ((restore continue))
  ((assign val (op *) (reg b) (reg val)))
  ((goto (reg continue)))
  ((assign val (const 1)))
  ((goto (reg continue))))

; Labels (association list):
'((controller
    ((assign continue (label expt-done)))
    ((test (op =) (reg n) (const 0)))
    ((branch (label base-case)))
    ((save continue))
    ((assign n (op -) (reg n) (const 1)))
    ((assign continue (label after-expt)))
    ((goto (label expt-loop)))
    ((restore continue))
    ((assign val (op *) (reg b) (reg val)))
    ((goto (reg continue)))
    ((assign val (const 1)))
    ((goto (reg continue))))

  (expt-loop
    ((test (op =) (reg n) (const 0)))
    ((branch (label base-case)))
    ((save continue))
    ((assign n (op -) (reg n) (const 1)))
    ((assign continue (label after-expt)))
    ((goto (label expt-loop)))
    ((restore continue))
    ((assign val (op *) (reg b) (reg val)))
    ((goto (reg continue)))
    ((assign val (const 1)))
    ((goto (reg continue))))

  (after-expt
    ((restore continue))
    ((assign val (op *) (reg b) (reg val)))
    ((goto (reg continue)))
    ((assign val (const 1)))
    ((goto (reg continue))))

  (base-case
    ((assign val (const 1)))
    ((goto (reg continue))))

  (expt-done))

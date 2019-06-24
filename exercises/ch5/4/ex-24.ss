; Exercise 5.24
; cond as new basic special form
; (without reducing to if)

ev-cond
  (save env)
  (save continue)
  (assign exp (op cond-clauses) (reg exp))

ev-cond-loop
  (assign unev (op cdr) (reg exp)) ; rest clauses
  (assign exp (op car) (reg exp)) ; first clause
  (save exp)
  (save unev)
  (test (op cond-else-clause?) (reg exp))
  (branch (label ev-cond-else))
  (assign exp (op cond-predicate) (reg exp)) ; get predicate
  (assign continue (label ev-cond-test-clause))
  (goto (label eval-dispatch))

ev-cond-test-clause
  (test (op true?) (reg val))
  (branch (label cond-ev-seq))
  (restore exp)
  (restore unev)
  (assign exp (reg unev)) ; evaluate rest
  (goto (label ev-cond-loop))

ev-cond-else
  (test (op null?) (reg unev)) ; error checking 'else'
  (branch (label ev-cond-seq))
  (goto (label ev-cond-else-error))

ev-cond-seq
  (restore exp)
  (restore env)
  (restore continue)
  (assign exp (op cond-actions) (reg exp))
  (goto (label ev-sequence))

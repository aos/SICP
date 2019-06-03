; Exercise 5.4

; 1. Recursive exponentiation
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1))))) 

(controller
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
    (perform (op print) (reg val)))

; 2. Iterative
(define (expt b n)
  (define (expt-iter counter product)
    (if (= counter 0)
        product
        (expt-iter (- counter 1)
                   (* b product))))
  (expt-iter n 1))

(controller
    (assign b (op read))
    (assign counter (op read))
    (assign product (const 1))
    
  iter-loop
    (test (op =) (reg counter) (const 0))
    (branch (label iter-done))
    (assign counter (op -) (reg counter) (const 1))
    (assign product (op *) (reg b) (reg product))
    (goto (label iter-loop))

  iter-done
    (perform (op print) (reg product)))

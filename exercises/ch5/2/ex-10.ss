; Exercise 5.10
; Add an increment instruction (inc reg)

(define (make-execution-procedure
          inst labels machine pc flag stack ops)
  (cond ((eq? (car inst) 'assign)
         (make-assign
           inst machine labels ops pc))
        ((eq? (car inst) 'test)
         (make-test
           inst machine labels ops flag pc))
        ((eq? (car inst) 'branch)
         (make-branch
           inst machine labels flag pc))
        ((eq? (car inst) 'inc) ;; here
         (make-inc inst machine pc))
        ((eq? (car inst) 'goto)
         (make-goto inst machine labels pc))
        ((eq? (car inst) 'save)
         (make-save inst machine stack pc))
        ((eq? (car inst) 'restore)
         (make-restore inst machine stack pc))
        ((eq? (car inst) 'perform)
         (make-perform
           inst machine labels ops pc))
        (else (error
                "Unknown instruction type: ASSEMBLE"
                inst))))

(define (make-inc inst machine pc)
  (let ((reg
          (get-register
            machine
            (inc-reg-name inst))))
    (lambda ()
        (set-contents! reg (+ 1 (get-contents reg)))
        (advance-pc pc))))

(define (inc-reg-nae inc-instruction)
  (cadr inc-instruction))

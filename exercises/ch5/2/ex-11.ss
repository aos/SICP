; Exercise 5.11

; 1. Remove assigning to n what's in val and just directly restore val to n
; ...
  afterfib-n-2 ; upon return, val contains Fib(n − 2)
    (restore n)
; ...

; 2.
(define (make-save inst machine stack pc)
  (let ((reg (get-register
               machine
               (stack-inst-reg-name inst))))
    (lambda ()
      (push stack (cons stack-inst-reg-name ;; Save register name on stack
                        (get-contents reg)))
      (advance-pc pc))))

(define (make-restore inst machine stack pc)
  (let ((reg (get-register
               machine
               (stack-inst-reg-name inst)))
        (stack-item (pop stack)))
    (if (eq? (car stack-item) ;; Check matching register name
             (stack-inst-reg-name inst))
        (lambda ()
          (set-contents! reg (cdr stack-item))
          (advance-pc pc))
        (error "Incorrect register name on stack: RESTORE"
               stack-inst-reg-name))))

; 3.
(define (make-new-machine)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag)) ; Used to control branching
        (the-instruction-sequence '()))
    (let ((the-ops
            (list (list 'initialize-stack
                        (lambda ()
                          (for-each (lambda (stack)
                                      (stack 'initialize))
                                    (map cadr stack-table))))))
          ; .. create a stack table
          (stack-table '()))
      ;...
      (define (lookup-stack name)
        (let ((val
                (assoc name stack-table)))
          (if val
              (cadr val)
              (error "Unknown register:" name))))
      ; Allocate a stack
      (define (allocate-stack name)
        (if (assoc name stack-table)
            (error "Multiply defined stacks: " name)
            (set! stack-table
                  (cons
                    (list name
                          (make-stack))
                    stack-table)))
        'stack-allocated)
      (define (dispatch message)
        (cond ;...
              ((eq? message 'get-stack) lookup-stack)
              ((eq? message 'allocate-stack) allocate-stack) ;; allocate stack
              (else (error "Unknown request: MACHINE"
                           message))))
      dispatch)))

(define (make-machine register-names
                      ops
                      controller-text)
  (let ((machine (make-new-machine)))
    (for-each (lambda (register-name)
                ((machine 'allocate-register)
                 register-name))
              register-names)
    (for-each (lambda (reg-name) ;; New stack for each register
                ((machine 'allocate-stack)
                 reg-name))
              register-names)
    ((machine 'install-operations) ops)
    ((machine 'install-instruction-sequence)
     (assemble controller-text machine))
    machine))

;; Grabbing stacks
(define (make-save inst machine pc)
  (let ((reg (get-register
               machine
               (stack-inst-reg-name inst)))
        (stack (get-stack
                 machine
                 (stack-inst-reg-name inst))))
    (lambda ()
      (push stack (get-contents reg))
      (advance-pc pc))))

(define (make-restore inst machine pc)
  (let ((reg (get-register
               machine
               (stack-inst-reg-name inst)))
        (stack (get-stack
                 machine
                 (stack-inst-reg-name inst))))
    (lambda ()
      (set-contents! reg (pop stack))
      (advance-pc pc))))

(define (get-stack machine reg-name)
  ((machine 'get-stack) reg-name))

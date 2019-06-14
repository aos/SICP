; Exercise 5.13

;; While extracting the labels and instructions,
; we also extract the registers
(define (extract-labels text receive)
  (if (null? text)
      (receive '() '() '())
      (extract-labels
        (cdr text)
        (lambda (insts labels regs)
          (let ((next-inst (car text)))
            (if (symbol? next-inst) ; label
                (receive
                  insts
                  (cons (make-label-entry next-inst
                                          insts)
                        labels)
                  regs)
                (receive
                    (cons (make-instruction next-inst)
                          insts)
                    labels
                    ; We only include registers we have not found yet
                    (append (extract-regs next-inst regs)
                            regs))))))))

; Extracts all the registers in a single instruction
(define (extract-regs instruction regs)
  (cond ((null? instruction) '())
        ((and (pair? (car instruction))
              (eq? (caar instruction) 'reg)
              (not (memq (cadar instruction) regs)))
         (cons (cadar instruction)
               (extract-regs (cdr instruction) regs)))
        (else (extract-regs (cdr instruction) regs))))

(define (assemble controller-text machine)
  (extract-labels controller-text
                  (lambda (insts labels regs)
                    ;; Allocate all the extract regs during assembly
                    (for-each
                      (lambda (reg)
                        ((machine 'allocate-register) reg))
                    regs)
                    (update-insts! insts
                                   labels
                                   machine)
                    insts)))

;; 1. New signature for (make-machine), remove register-names
(define (make-machine ops
                      controller-text)
  ;; ...rest of code
  )

;; 2. Remove list of pre-allocated registers from machine

(define fib-machine
  (make-machine
    ;; '(continue n val)  <-- Not necessary anymore
    (list (list '- -)
          (list '< <)
          (list '+ +))
    '(controller
       ; ... rest of instructions
       )))
 
; ------- Alternative solution
; Just allocate the register in 'lookup-register if not found
(define (lookup-register name)
        (let ((val
                (assoc name register-table)))
          (if val
              (cadr val)
              (begin
                (allocate-register name)
                (lookup-register name)))))

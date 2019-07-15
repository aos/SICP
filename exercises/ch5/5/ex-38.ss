; Exercise 5.38
; Open-coding of primitives
; Includes two special argument registers (arg1, arg2)

(define (open-code? exp)
  (and (pair? exp)
       (memq (operator exp) open-codes)))

(define open-codes '(= * / - +))

; 1.
(define (make-open-code-insts op operands target linkage)
  (let ((first-operand-code
          (compile (car operands) 'arg1 'next))
        (second-operand-code
          (compile (cadr operands) 'arg2 'next)))
    (end-with-linkage
      linkage
      (append-instruction-sequences
        first-operand-code
        (preserving
          '(arg1)
          second-operand-code
          (make-instruction-sequence
            '(arg1 arg2)
            (list target)
            `((assign ,target
                      (op ,op)
                      (reg arg1)
                      (reg arg2)))))))))


; 2.
(define (compile-open-code exp target linkage)
  (let ((op (operator exp))
        (args (operands exp)))
    (if (or (eq? op '=)
            (eq? op '-))
        (make-open-code-insts op
                              args
                              target
                              linkage)
        (make-open-code-insts op
                              (construct-operands op
                                                  args)
                              target
                              linkage))))

; 3.
; (+ 1 2 3 4 5) -> ((+ (+ (+ 1 2) 3) 4) 5)
(define (construct-operands op operands)
  (if (= (length operands) 2)
      operands
      (construct-operands op
                          (cons (list op
                                      (car operands)
                                      (cadr operands))
                                (cddr operands)))))

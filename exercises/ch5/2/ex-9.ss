; Exercise 5.9
; Don't allow operations on labels

(define (make-operation-exp
          exp machine labels operations)
  (let ((op (lookup-prim
              (operation-exp-op exp)
              operations))
        (aprocs
          (map (lambda (e)
                 (if (label-exp? e)
                     (error "Can't operate on labels: MAKE-OPERATION-EXP"
                            e)
                     (make-primitive-exp
                       e machine labels)))
               (operation-exp-operands exp))))
    (lambda () (apply op (map (lambda (p) (p))
                              aprocs)))))

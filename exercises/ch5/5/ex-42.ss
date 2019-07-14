; Exercise 5.42
; Re-write compile-variable and compile-assignment to ouput
; lexical address instructions

(define (compile-variable
          exp target linkage compile-env)
  (let ((var-addr (find-variable exp
                                 compile-env)))
    (end-with-linkage
      linkage
      (make-instruction-sequence
        '(env)
        (list target)
        (if (eq? var-addr 'not-found)
            `((assign ,target
                      (op lookup-variable-value)
                      (const ,exp)
                      ; Look for it straight in global env
                      (op get-global-environment)))
            `((assign ,target
                      (op lexical-address-lookup)
                      (const ,var-addr)
                      (reg env))))))))

(define (compile-assignment
          exp target linkage compile-env)
  (let* ((var (assignment-variable exp))
         (get-value-code
           (compile (assignment-value exp)
                    'val
                    'next))
         (var-addr (find-variable var
                                  compile-env)))
    (end-with-linkage
      linkage
      (preserving
        '(env)
        get-value-code
        (make-instruction-sequence
          '(env val)
          (list target)
          (if (eq? var-addr 'not-found)
              `((perform (op set-variable-value!)
                         (const ,var)
                         (reg val)
                         (reg env)))
              `((perform (op lexical-address-set!)
                         (const ,var-addr)
                         (reg val)
                         (reg env))
                (assign ,target (const ok)))))))))

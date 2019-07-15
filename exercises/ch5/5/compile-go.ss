; Compile and go

(load "../../ch4/1/syntax.ss")
(load "../../ch4/1/ds.ss")

(define apply-in-underlying-scheme apply)

(load "../../ch4/1/global.ss")

;; Arg helpers
(define (empty-arglist) '())
(define (adjoin-arg arg arglist)
  (append arglist (list arg)))
(define (last-operand? ops) (null? (cdr ops)))

; machine model
(load "clean-machine-model.ss")
(load "../2/machine-assembler.ss")
(load "../2/machine-execution-procs.ss")

(define (get-global-environment)
  the-global-environment)

(load "compile.ss")
(load "compile-linkage.ss")
(load "compile-combining-inst.ss")
(load "compile-operations.ss")
(load "compile-eval.ss")

(define (user-print object)
  (cond ((compound-procedure? object)
         (display
           (list 'compound-procedure
                 (procedure-parameters object)
                 (procedure-body object)
                 '<procedure-env>)))
        ((compiled-procedure? object)
         (display '<compiled-procedure>))
        (else (display object))))

(define (compile-and-go expression)
  (let ((instructions
          (assemble
            (statements
              (compile
                expression 'val 'return))
            eceval)))
    (set! the-global-environment
      (setup-environment))
    (set-register-contents!
      eceval 'val instructions)
    (set-register-contents!
      eceval 'flag #t)
    (start eceval)))

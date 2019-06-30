; Running the explicit evaluator

(load "../../ch4/1/syntax.ss")
(load "../../ch4/1/ds.ss")

(define apply-in-underlying-scheme apply)

(load "../../ch4/1/global.ss")
(load "ex-30.ss") ; make unbound variable

;; Arg helpers
(define (empty-arglist) '())
(define (adjoin-arg arg arglist)
  (append arglist (list arg)))
(define (last-operand? ops) (null? (cdr ops)))

; machine model
(load "../2/machine-model.ss")
(load "../2/machine-assembler.ss")
(load "../2/machine-execution-procs.ss")
(load "../2/ex-17.ss") ; storing labels
(load "../2/ex-19.ss") ; breakpoints

(define (get-global-environment)
  the-global-environment)

(load "ex-28.ss"); no-more-exps?
(load "explicit-operations.ss")
(load "explicit-eval.ss")

; Exercise 5.48
; compile-and-run

(define (compile-exp expression)
  (assemble (statements
              (compile expression 'val 'return))
            eceval))

(define (compile-and-run? exp)
  (tagged-list? exp 'compile-and-run))

(define (compile-and-run-exp exp)
  (display exp) (cadadr exp))

;; add this to evaluator

;ev-compile-and-run
;  ;; we compile here
;  (assign val (op compile-and-run-exp) (reg exp))
;  (assign val (op compile-exp) (reg val))
;  (goto (label external-entry))

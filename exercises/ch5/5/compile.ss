; Compiler

(define (compile exp target linkage)
  (cond ((self-evaluating? exp)
         (compile-self-evaluating
           exp target linkage))
        ((quoted? exp)
         (compile-quoted exp target linkage))
        ((variable? exp)
         (compile-variable exp target linkage))
        ((assignment? exp)
         (compile-assignment exp target linkage))
        ((definition? exp)
         (compile-definition exp target linkage))
        ((if? exp)
         (compile-if exp target linkage))
        ((lambda? exp)
         (compile-lambda exp target linkage))
        ((begin? exp)
         (compile-sequence
           (begin-actions exp) target linkage))
        ((cond? exp)
         (compile
           (cond->if exp) target linkage))
        ((open-code? exp)
         (compile-open-code exp target linkage))
        ((application? exp)
         (compile-application
           exp target linkage))
        (else
          (error "Unknown expression type: COMPILE"
                 exp))))

; Instruction sequences
; needs       -> regs that must be initialized before execution
; modifies    -> modified regs by sequence
; statements  -> actual instructions
(define (make-instruction-sequence
          needs modifies statements)
  (list needs modifies statements))

(define (empty-instruction-sequence)
  (make-instruction-sequence '() '() '()))

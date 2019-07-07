; Exercise 5.36
; Order-of-evaluation

; 1. Compiler is right-to-left
; While we (map ...) the operands left-to-right, ultimately we end up reversing
; the operands under (construct-arglist ...) which will generate the
; operations. The generated operations are run right-to-left.

; 2. To change it to left-to-right, we remove the reversal at the beginning.
; This will generate the appropriate code. However, cons-ing this code will
; return to us a reversed arglist. We then add an instruction to reverse the
; arglist at the end.

(define (construct-arglist operand-codes)
  ; remove reversal
  (if (null? operand-codes)
      ;...
      (if (null? (cdr operand-codes))
          code-to-get-last-arg
          ; here
          (tack-on-instruction-sequence
            (preserving
              '(env)
              code-to-get-last-arg
              (code-to-get-rest-args
                (cdr operand-codes)))
            ;; here
            (assign argl (op reverse) (reg argl))))))

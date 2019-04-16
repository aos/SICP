; Exercise 4.1
; Write 'list-of-values' that evaluates operands from left-to-right regardless
; of the order of evaluation in the underlying Lisp.

; Left-to-right
(define (list-of-values-lr exps env)
  (if (no-operands? exp)
      '()
      (let ((first (eval (first-operand exps) env))
            (rest (eval (rest-operands exps) env)))
        (cons first rest))))

; Right-to-left
(define (list-of-values-rl exps env)
  (list-of-values-lr (reverse exps) env))

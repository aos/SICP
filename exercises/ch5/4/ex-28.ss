; Exercise 5.28
; Using a non-tail recursive implementation of evaluator

(define (no-more-exps? exps)
  (null? exps))

;; Add to ev-sequence
;
;  (test (op no-more-exps?) (reg unev))
;  (branch (label ev-sequence-end))
;
;ev-sequence-end
;  (restore continue)
;  (goto (reg continue))

; For the iterative factorial, the stack indeed
; now grows linearly with input

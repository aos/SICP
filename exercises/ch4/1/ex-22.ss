; Exercise 4.22
; Extend the analysis-executor evaluator to handle 'let'

; ...
((let? exp) (analyze (let->combination exp)))

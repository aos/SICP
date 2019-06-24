; Exercise 5.23
; Add cond, let (derived expressions)

; cond
(test (op cond?) (reg exp))
(branch (label ev-cond))

ev-cond
  (assign exp (op cond->if) (reg exp))
  (goto (label ev-if))

; let
(test (op let?) (reg exp))
(branch (label ev-let))

ev-let
  (assign exp (op let->combination) (reg exp))
  (goto (label ev-lambda))

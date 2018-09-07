; Exercise 2.45
; Re-define 'right-split' and 'up-split' in terms of a general
; 'split' procedure

(define right-split (split beside below))
(define up-split (split below beside))

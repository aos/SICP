; Exercise 3.36
; We define the following sequence of expressions in the global env:

(define a (make-connector))
(define b (make-connector))
(set-value! a 10 'user)

; This eventually runs:
(for-each-except
  setter inform-about-value constraints)

; 'for-each-except' -> 'loop' -> 'inform-about-value' -> no constraints -> done

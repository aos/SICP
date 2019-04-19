; Exercise 4.31
; Upward-compatible extension for lazy evaluation

(define (f a (b lazy) c (d lazy-memo))
  ;; ...
  )

; 'a' and 'c' will be evaluated on procedure call
; 'b' will be delayed
; 'd' will be delayed and memoized

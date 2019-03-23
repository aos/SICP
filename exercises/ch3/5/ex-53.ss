; Exercise 3.53
; Describe elements of this stream:

(define s (cons-stream 1 (add-streams s s)))

; (1 2 4 8 16 32 ...)
; Power of 2s

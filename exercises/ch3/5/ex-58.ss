; Exercise 3.58
; Give an interpretation of the stream computed by procedure:
; radix == base

(define (expand num den radix)
  (cons-stream
    (quotient (* num radix) den)
    (expand (remainder (* num radix) den)
            den
            radix)))

; This stream computes the decimal value of a fraction

(expand 1 7 10) ; (1 4 2 8 5 7 1 ...)

(expand 3 8 10) ; (3 7 5 0 0 ...)

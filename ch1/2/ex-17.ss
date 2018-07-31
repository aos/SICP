; Exercise 1.17
; This algorithm is linear in 'b'
; Define operations 'double' which doubles an integer and 'halve' which divides
; an (even) integer by 2
; Design a procedure that uses a logarithmic # of steps
(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (mult a (halve b))))
        (else (+ a (mult a (- b 1))))))

; Exercise 2.48
; Make segment constructor and selectors
; A directed line segment in the plane can be represented as a pair of vectors

; Vector library
(define (make-vect x y) (cons x y))
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

(define v1 (make-vect 0 0))
(define v2 (make-vect 1 1))

; Segments
(define (make-segment vect1 vect2) (cons vect1 vect2))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

; Test
(end-segment (make-segment v1 v2))

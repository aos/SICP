; Exercise 2.47
; Create selectors for frames

(define f (make-frame 1 2 3))

; Implementation 1
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

; Selectors
(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (cadr frame))
(define (edge2-frame frame) (caddr frame))

; Test
(origin-frame f)
(edge1-frame f)
(edge2-frame f)

; Implementation 2
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

; Selectors
(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (cadr frame))
(define (edge2-frame frame) (cddr frame))

; Exercise 2.2
; Line segments in a plane represented as a pair of points:
; a starting point and an ending point
; 'make-segment', 'start-segment', 'end-segment' (in terms of points)

; A point is a pair of #s:
; 'make-point', 'x-point', 'y-point'

; Define a procedure 'midpoint-segment' that takes a line segment as argument
; and returns its midpoint (the point whose coordinates are the average of the
; coordinates of the endpoints)

; Point
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
; Print point
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; Line segment
(define (make-segment start end) (cons start end))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

; Midpoint
(define (midpoint-segment line)
  (define (average x y) (/ (+ x y) 2))
  (let ((a (start-segment line))
        (b (end-segment line)))
    (make-point (average (x-point a)
                         (x-point b))
                (average (y-point a)
                         (y-point b)))))

(define seg (make-segment
              (make-point 2 3)
              (make-point 10 15)))

(print-point (midpoint-segment seg))

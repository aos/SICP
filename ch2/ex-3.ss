; Exercise 2.3
; Implement a representation for rectangles in a plane
; Compute the 'perimeter' and 'area' of a given rectangle

; Point "library"
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
; Print
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; Segment "library"
(define (make-segment start end) (cons start end))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))
; Length
(define (segment-length line)
  (let ((start (start-segment line))
        (end (end-segment line)))
    (sqrt
      (+
        (square (- (x-point start) (x-point end)))
        (square (- (y-point start) (y-point end)))))))

; Example
(define l1 (make-segment
              (make-point 2 2)
              (make-point 6 5)))
(define w1 (make-segment
             (make-point 2 2)
             (make-point 2 4)))
; Test
(segment-length l1) ; 5
(segment-length w1) ; 2

; Rectangle "library"
; There is an assumption here that the length and width segments are connected
; as can be seen in the example above
; However, this does not require axis-aligned rectangles and can be situated
; anywhere on the plane
(define (make-rectangle l-side w-side)
  (cons l-side w-side))
(define (side-one rect) (car rect))
(define (side-two rect) (cdr rect))

; Example/test
(define rect1 (make-rectangle l1 w1))

; Perimeter
; A perimeter requires adding the length of all segments
(define (perimeter rect)
  (+
    (* 2 (segment-length (side-one rect)))
    (* 2 (segment-length (side-two rect)))))

(perimeter rect1)

; Area
(define (area rect)
  (* (segment-length (side-one rect))
     (segment-length (side-two rect))))

(area rect1)

; Alternative representation
; Making a rectangle by defining (separately) all 4 points
(define (make-rectangle l-point-one
                        l-point-two
                        w-point-one
                        w-point-two)
  (cons (make-segment l-point-one
                      l-point-two)
        (make-segment w-point-one
                      w-point-two)))

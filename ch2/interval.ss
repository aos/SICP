; Interval arithmetics
; An "interval" has two endpoints: a lower bound and an upper bound

(define (make-interval lower-bound upper-bound)
  (cons lower-bound upper-bound))

; Exercise 2.7
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

; Adding intervals
(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

; Exercise 2.8
; Subtracting intervals
(define (sub-interval x y)
  (make-interval (- (lower-bound x)
                    (lower-bound y))
                 (- (upper-bound x)
                    (upper-bound y))))

; Multiplying intervals
; Find the min and max of the products of the bounds and using them as bounds of
; the resulting interval
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; Division
; Multiply the first by the reciprocal of the second
; Bounds of the reciprocal interval are the reciprocal of the upper bound and
; the reciprocal of the lower bound, in that order
(define (div-interval x y)
  (mul-interval x
                (make-interval
                  (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))


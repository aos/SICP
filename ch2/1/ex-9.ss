; Exercise 2.9
; Width of an interval

(define (make-interval lower-bound upper-bound)
  (cons lower-bound upper-bound))

(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

; Width of an interval:
; Half of the difference between its upper and lower bounds
(define (interval-width interval)
  (/ (- (upper-bound interval) (lower-bound interval))
     2.0))

(define interval1 (make-interval 3 7))
(define interval2 (make-interval 2 5))

(interval-width interval1) ; width = 2
(interval-width interval2) ; width = 1.5

(define sum-intervals (add-interval interval1 interval2))

; Interval width of summed intervals
(interval-width sum-intervals) ; width = 3.5 (corresponding to the two intervals)

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

(define product-intervals (mul-interval interval1 interval2))

; Interval width of product
; width = 14.5 (non-corresponding)
; Multiplying the original intervals of width 2 and 1.5, we should get a width
; of 3, when in fact we get a width of 14.5
(interval-width product-intervals)

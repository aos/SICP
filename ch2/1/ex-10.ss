; Exercise 2.10
; Error out when dividing by 0

(define (make-interval lower-bound upper-bound)
  (cons lower-bound upper-bound))

(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

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

; Re-writing interval division to error out if an interval spans a zero
(define (div-interval x y)
  (if (>= 0 (* (upper-bound y) (lower-bound y))) 
      (error "Cannot divide by 0!")
      (mul-interval x
                    (make-interval
                      (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

(define interval1 (make-interval 1 5))
(define interval2 (make-interval -1 3))

(div-interval interval1 interval2)

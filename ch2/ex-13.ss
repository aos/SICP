; Exercise 2.13
; Under the assumption of small percentage tolerances,
; there is a simple formula for the approximate percentage tolerance of the
; product of two intervals in terms of the tolerances of the factors

(define (make-interval lower-bound upper-bound)
  (cons lower-bound upper-bound))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))

(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))

(define (width i)
  (/ (- (upper-bound i)
        (lower-bound i))
     2))

(define (percent i)
  (/ (width i)
     (center i)))

(define (percent-two i)
  (/ (- (upper-bound i)
        (lower-bound i))
     (+ (upper-bound i)
        (lower-bound i))))

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

(define test-int-one (make-center-percent 3 .1))
(define test-int-two (make-center-percent 9 .2))

(percent (mul-interval test-int-one test-int-two))

(define (percent-prod int-one int-two)
  (+ (percent int-one)
     (percent int-two)))

; The approximate percentage tolerance of the product of two intervals in terms
; of the tolerances of the factors
; The sum of the percentage tolerance of the two intervals
(percent-prod test-int-one test-int-two)

; Exercise 2.14

; Interval library
(define (make-interval lower-bound upper-bound)
  (cons lower-bound upper-bound))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))
(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))
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
(define (div-interval x y)
  (mul-interval x
                (make-interval
                  (/ 1.0 (lower-bound y))
                  (/ 1.0 (upper-bound y)))))

; Center-percent library
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

; Parallel resistors formula 1
(define (par1 r1 r2)
  (div-interval
    (mul-interval r1 r2)
    (add-interval r1 r2)))

; Parallel resistors formula 2
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
      one
      (add-interval
        (div-interval one r1)
        (div-interval one r2)))))

;;; Investigating the behavior of the two different formula implementations
(define interval-a (make-center-percent 3 .01)) ; (2.97, 3.03)
(define interval-b (make-center-percent 6 .1)) ; (5.4, 6.6)

(define a-over-a (div-interval interval-a interval-a))
(define a-over-b (div-interval interval-a interval-b))
a-over-a
a-over-b

(par1 interval-a interval-b) ; (1.66542, 2.38925)
(par2 interval-a interval-b) ; (1.91613, 2.07684)

; The reason that the two parallel resistance formulas give different results is
; due to rounding errors, specifically when dividing by 'one'.
; The first formula only divides by 'one' just once, as the final step while the
; second formula divides by one three times. Each successive division by one
; increases the rounding error.

; Exercise 2.15
; Argument: 'par2' is a "better" program because it is written in a form such
; that no variable that represents an uncertain number is repeated.
; I believe she is wrong. The "uncertainty" is occurring during the division
; process (by one), which combined with floating point, causes rounding errors.
; Doing this successively in the case of "par2" causes an accumulation of
; rounding errors. The intervals of 'R1' and 'R2' are actually "certain", in the
; sense that a percentage tolerance for each number will give you a certain
; number. It is only division that causes problems. Therefore, limiting the
; number of divisions is the beset way to produce tighter error bounds.

; Exercise 2.16
; I've already explained this above, but essentially, any type of floating point
; computation will lead to some level of error. I think the best way to do this
; would be to do so some sort of "lazy" evaluation, as in, waiting till the last
; minute before doing the final computation. I am not going to attempt this
; problem at my level of knowledge at this time.

; So I was wrong about 2.15 (and the general premise behind these questions).
; Essentially, when we look at interval arithmetic we are looking for the
; possibility that numbers might exist inside this interval. Therefore, doing
; 'A/A' should ALWAYS return the value '1'. But this is not the case. In the
; same sense, we introduce uncertainty in 2.15 when we continuously introduce
; the intervals in the numerator and denominator. Introducing them once and only
; once as in 'par2', makes for a more accurate equation.

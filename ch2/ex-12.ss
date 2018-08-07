; Exercise 2.12
; Deal with numbers represented as a center value and an additive tolerance
; Eg. 3.5 ± 0.15

(define (make-interval lower-bound upper-bound)
  (cons lower-bound upper-bound))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))

(define (width i)
  (/ (- (upper-bound i)
        (lower-bound i))
     2))

; Define a constructor 'make-center-percent' that takes a center and a
; percentage tolerance and produces the desired interval
(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))

; Define the selector 'percent' that produces the percentage tolerance for a
; given interval
(define (percent i)
  (/ (width i)
     (center i)))

; Exercise 2.1
; Define a better version of 'make-rat' that handles both
; positive and negative arguments
; If the rational # is positive, both numerator and denominator are positive.
; If rational number is negative, only numerator is negative

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-rat n d)
  (let ((g ((if (< d 0) - +) (gcd n d))))
    (cons (/ n g) (/ d g))))

(print-rat
  (make-rat 1 -3)) ; -1/3

(print-rat
  (make-rat -1 -3)) ; 1/3

(print-rat
  (make-rat -1 3)) ; -1/3

(print-rat
  (make-rat 1 3)) ; 1/3

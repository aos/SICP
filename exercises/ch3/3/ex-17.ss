; Exercise 3.17
; Correct version of 'count-pairs'

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define (count-pairs s)
  (define (count-iter struct tracked)
    ())
  (count-iter s '()))

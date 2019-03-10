; Exercise 3.17
; Correct version of 'count-pairs'

(define (count-pairs struct)
  (let ((tracked '()))
    (define (count-iter s)
      (if (or (not (pair? s)) (memq s tracked))
          0
          (begin 
            (set! tracked (cons s tracked))
            (+ (count-iter (car s))
               (count-iter (cdr s))
               1))))
    (count-iter struct)))

(define three (list 'a 'b 'c))
(count-pairs three) ; 3

(define (make-four l)
  (let ((tmp (cons l l)))
    (set-cdr! tmp (cdr l))
    tmp))
(count-pairs (make-four (list 'a 'b))) ; 3

(define (make-seven l)
  (let ((tmp (cons l l)))
    (cons tmp tmp)))
(count-pairs (make-seven '(a))) ; 3

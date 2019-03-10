; Exercise 3.16
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define three (list 'a 'b 'c))
(count-pairs three) ; 3

(define x (list 'a 'b))

(define (make-four l)
  (let ((tmp (cons l l)))
    (list tmp)))
(count-pairs (make-four x)) ; 4

(define (make-seven l)
  (let ((tmp (cons l l)))
    (cons tmp tmp)))
(count-pairs (make-seven '(a))) ; 7

; Infinite
(define cycle (list 'a 'b))
(set-cdr! (cdr cycle) cycle)
(count-pairs cycle) 

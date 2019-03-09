; 'count-leaves' procedure

(define x (cons (list 1 2) (list 3 4)))

(length x) ; 3

(count-leaves x) ; 4

(list x x) ; (((1 2) 3 4) ((1 2) 3 4))

(length (list x x)) ; 2
(count-leaves (list x x)) ; 8

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1) ; Tests whether its argument is a pair
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

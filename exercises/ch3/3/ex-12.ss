; Exercise 3.12

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

; Interactions
(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

z ; (a b c d) --> new list is created

(cdr x) ; (b)

(define w (append! x y))

w ; (a b c d)

(cdr x) ; (b c d)

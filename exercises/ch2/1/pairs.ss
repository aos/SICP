; Pairs - list-structured data

(define x (cons 1 2))

; Extract the beginning of the list
(car x) ; 1

; Extract the rest of the list
(cdr x) ; 2

; Even more stuff
(define y (cons 3 4))
(define z (cons x y))

(car (car z)) ; 1
(car (cdr z)) ; 3

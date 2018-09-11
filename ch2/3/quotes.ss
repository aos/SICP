; Quotes

(define a 1)
(define b 2)
(list a b) ; (1 2)

(list 'a 'b) ; (a b)
(list 'a b) ; (a 2)

(car '(a b c)) ; a
(cdr '(a b c)) ; (b c)

; 'eq?' takes 2 symbols as arguments and tests whether they are the same
(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

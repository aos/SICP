; Exercise 4.68

; From 2.18
(define (reverse items)
  (if (null? (cdr items))
      items
      (append (reverse (cdr items))
              (list (car items)))))

(rule (append-to-form () ?y ?y))
(rule (append-to-form (?u . ?v) ?y (?u . ?z))
      (append-to-form ?v ?y ?z))

(rule (reverse ?list ?list-reverse)
      (and (append-to-form (?x) ?y ?list)
           (append-to-form ?y-rest (?x) ?list-reverse)
           (reverse ?y ?y-rest)))

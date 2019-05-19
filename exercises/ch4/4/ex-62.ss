; Exercise 4.62

(define (last-pair l)
  (if (null? (cdr l))
      (list (car l))
      (last-pair (cdr l))))

(last-pair (list 23 72 149 34)) ; (34)

;; Using query language

(rule (last-pair (?x) (?x)))
(rule (last-pair (?u . ?v) (?x))
      (last-pair ?v (?x)))

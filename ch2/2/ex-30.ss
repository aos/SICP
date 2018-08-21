; Exercise 2.30
; Define 'square-tree'

(define nil '())
(define tex (list 1
                  (list 2
                        (list 3 4)
                        5)
                  (list 6 7)))

; Directly
(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree tree))
        (else
          (cons (square-tree (car tree))
                (square-tree (cdr tree))))))

; Using map
(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (* sub-tree sub-tree)))
       tree))

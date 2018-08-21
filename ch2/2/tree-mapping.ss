; Mapping over trees

(define (scale-tree tree factor)
  (cond ((null? tree) '())
        ((not (pair? tree))
         (* tree factor))
        (else
          (cons (scale-tree (car tree)
                            factor)
                (scale-tree (cdr tree)
                            factor)))))

(define t-1 (list 1
                  (list 2
                        (list 3 4)
                        5)
                  (list 6 7)))

; Another way to implement 'scale-tree' is to regard the tree
; as a sequence of sub-trees and use 'map'
; Map over the sequence, scaling each subtree in turn, and return list of
; results
(define (scale-tree tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree sub-tree factor)
             (* sub-tree factor)))
       tree))

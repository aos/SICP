; Exercise 2.31
; Abstract 'square-tree' to just 'tree-map'

(define (tree-map proc tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map proc sub-tree)
             (proc sub-tree)))
       tree))

(define (square x) (* x x))
(define tex (list 1
                  (list 2
                        (list 3 4)
                        5)
                  (list 6 7)))

(tree-map square tex)

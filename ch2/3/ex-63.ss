; Exercise 2.63
; Convert binary tree to list

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define t1 (make-tree
             7
             (make-tree
               3
               (make-tree 1 '() '())
               (make-tree 5 '() '()))
             (make-tree
               9
               '()
               (make-tree 11 '() '()))))

(define t2 (make-tree
             3
             (make-tree 1 '() '())
             (make-tree
               7
               (make-tree 5 '() '())
               (make-tree
                 9
                 '()
                 (make-tree 11 '() '())))))

(define t3 (make-tree
             5
             (make-tree
               3
               (make-tree 1 '() '())
               '())
             (make-tree
               9
               (make-tree 7 '() '())
               (make-tree 11 '() '()))))

(define t4 (make-tree
             1
             '()
             (make-tree
               2
               '()
               (make-tree
                 3
                 '()
                 (make-tree
                   4
                   '()
                   (make-tree 5 '() '()))))))

(define t5 (make-tree
             5
             (make-tree
               4
               (make-tree
                 3
                 (make-tree
                   2
                   (make-tree 1 '() '())
                   '())
                 '())
               '())
             '()))

; Recursive - converts a binary tree to a list
(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append
        (tree->list-1
          (left-branch tree))
        (cons (entry tree)
              (tree->list-1
                (right-branch tree))))))

; Iterative
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list
          (left-branch tree)
          (cons (entry tree)
                (copy-to-list
                  (right-branch tree)
                  result-list)))))
  (copy-to-list tree '()))

; 1. They produce the same result for every tree. For all trees, they produce
; the list: (1 3 5 7 9 11)
; 2. The second procedure grows more slowly because it does not use 'append'.
; With 'append', we essentially have to iterate through every part of the left
; branch. Because 'append' runs in linear time, we add an extra O(n) to our
; first procedure, causing the time complexity to jump to O(n * log n), where as
; the second procedure runs in O(n) since we have to run through all the nodes
; to create the list.

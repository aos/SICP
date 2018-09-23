; Exercise 2.63
; Convert binary tree to list

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree
           (entry set)
           (adjoin-set x (left-branch set))
           (right-branch set)))
        ((> x (entry set))
         (make-tree
           (entry set)
           (left-branch set)
           (adjoin-set x (right-branch set))))))

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

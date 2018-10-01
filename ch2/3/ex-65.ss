; Exercise 2.65
; Use 2.63 and 2.64 to give O(n) implementation of 'union-set' and
; 'intersection-set' for sets implemented as (balanced) binary trees

; O(n) 'union-set' using ordered sets
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((= (car set1) (car set2))
         (cons (car set1)
               (union-set (cdr set1) (cdr set2))))
        ((< (car set1) (car set2))
         (cons (car set1)
               (union-set (cdr set1) set2)))
        (else (cons (car set2)
                    (union-set set1 (cdr set2))))))
; O(n) 'intersection-set'
(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1))
            (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1 (intersection-set
                          (cdr set1)
                          (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1)
                                 set2))
              ((< x2 x1)
               (intersection-set set1
                                 (cdr set2)))))))
; O(n) 'tree->list'
(define (tree->list tree)
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


; O(n) 'list->tree'
(define (list->tree elements)
  (car (partial-tree
        elements (length elements))))
(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size
             (quotient (- n 1) 2)))
        (let ((left-result
               (partial-tree
                elts left-size)))
          (let ((left-tree
                 (car left-result))
                (non-left-elts
                 (cdr left-result))
                (right-size
                 (- n (+ left-size 1))))
            (let ((this-entry
                   (car non-left-elts))
                  (right-result
                   (partial-tree
                    (cdr non-left-elts)
                    right-size)))
              (let ((right-tree
                     (car right-result))
                    (remaining-elts
                     (cdr right-result)))
                (cons (make-tree this-entry
                                 left-tree
                                 right-tree)
                      remaining-elts))))))))

; O(n) 'union-set' using balanced binary trees
(define (union-tree set1 set2)
  (let ((set1-list (tree->list set1))
        (set2-list (tree->list set2)))
    (list->tree (union-set set1-list set2-list))))

; O(n) 'intersection-set' using balanced binary trees
(define (intersection-set-tree set1 set2)
  (let ((set1-list (tree->list set1))
        (set2-list (tree->list set2)))
    (list->tree (intersection-set set1-list set2-list))))

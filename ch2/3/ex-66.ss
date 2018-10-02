; Exercise 2.66
; Implement the 'lookup' procedure for the case where the set of records is
; structured as a binary tree, ordered by the numerical values of the keys

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (lookup given-key tree-of-records)
  (cond ((null? (entry tree-of-records)) false)
        ((equal? given-key
                 (entry tree-of-records))
         (entry tree-of-records))
        ((< given-key (entry tree-of-records))
         (lookup given-key
                 (left-branch tree-of-records)))
        (else
          (lookup given-key
                  (right-branch tree-of-records)))))

; Exercise 2.59
; Implement 'union-set'
; Set of elements which are in A, in B, or in both A and B

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (cond ((null? set2) set1) 
        ((not (element-of-set? (car set2) set1))
         (cons (car set2)
               (union-set set1 (cdr set2))))
        (else (union-set set1 (cdr set2)))))

; Using append and filter
(define (union-set set1 set2)
  (append set1
          (filter
            (lambda (x) (not (element-of-set? x set1)))
            set2)))

; Using 'adjoin-set'
(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set)))

(define (union set1 set2)
  (fold-right adjoin-set set2 set1))

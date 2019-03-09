; Exercise 2.60
; Allow duplicates in set
; For example: the set {1, 2, 3} could be represented as (2 3 2 1 3 2 2)
; Re-design the procedures

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; Since we allow duplicates, anything can be added to the set
; This is faster than the previous implementation since we don't need to call
; 'element-of-set?' now
(define (adjoin-set x set)
  (cons x set))

; This is also fast as we are just appending one set to another!
(define (union-set set1 set2)
  (fold-right adjoin-set set2 set1))
; Alternatively
(define (union-set set1 set2)
  (append set1 set2))

; No extra work needs to be done here
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2))
         '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1)
                                 set2)))
        (else (intersection-set (cdr set1)
                                set2))))

; Representing sets

; Sets as unordered lists
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; Adjoin
; Returns a set that contains the elements of the original set
; and the adjoined element
(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

; Intersection
; Set which contains only elements that appear in BOTH sets
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2))
         '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1)
                                 set2)))
        (else (intersection-set (cdr set1)
                                set2))))

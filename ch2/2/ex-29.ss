; Exercise 2.29
; Binary mobiles

(define (make-mobile left right)
  (list left right))

(define (make-branch len structure)
  (list len structure))

; Exercise 1
; Define selectors
(define (left-branch mobile)
  (newline)
  (display "mobile (left-branch): ")(display (car mobile))
  (car mobile))

(define (right-branch mobile)
  (newline)
  (display "mobile (right-branch): ")(display (car (cdr mobile)))
  (car (cdr mobile)))

(define (branch-length branch)
  (newline)
  (display "branch length: ")(display branch)
  (car branch))

(define (branch-structure branch)
  (newline)
  (display "branch structure: ")(display (car (cdr branch)))
  (car (cdr branch)))

; Exercise 2
; Get total weight of mobile
(define (total-weight mobile)
  (cond ((not (pair? mobile)) 0) 
        ((not (pair? (branch-structure mobile)))
         (branch-structure mobile))
        (else (+ (total-weight (left-branch mobile))
                 (total-weight (right-branch mobile))))))

; Make some test mobiles
(define clrs (make-mobile
               (make-branch 9 20)
               (make-branch 5
                            (make-mobile
                              (make-branch 7 13)
                              (make-branch 2
                                           (make-mobile
                                             (make-branch 3
                                                          (make-mobile
                                                            (make-branch 2 4)
                                                            (make-branch 5 15)))
                                             (make-branch 9 10)))))))
(define simple (make-mobile
                 (make-branch 2
                              (make-mobile
                                (make-branch 3 4)
                                (make-branch 1 5)))
                 (make-branch 8 9))) 

(total-weight clrs)
(total-weight simple)

; Exercise 3
; Balanced mobiles
; Torque = length x weight
; If left torque == right torque, then we're balanced
(define (balanced? mobile))

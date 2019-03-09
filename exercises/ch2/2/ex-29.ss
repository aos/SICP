; Exercise 2.29
; Binary mobiles

(define (make-mobile left right)
  (list left right))

(define (make-branch len structure)
  (list len structure))

; Exercise 1
; Define selectors
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (is-branch? structure)
  (not (pair? (car structure))))

; Exercise 2
; Get total weight of mobile
(define (total-weight mobile)
  (cond ((null? mobile) 0) 
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

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

(total-weight clrs) ; 20 + 13 + 4 + 15 + 10 = 62
(total-weight simple) ; 4 + 5 + 9 = 18

; A balanced mobile
(define b-mob (make-mobile
                (make-branch 2
                             (make-mobile
                               (make-branch 3 6)
                               (make-branch 9 2)))
                (make-branch 4 4)))

(define simple-balanced (make-mobile
                          (make-branch 3 6)
                          (make-branch 9 2)))

(define complex-balanced (make-mobile
                           (make-branch 5
                                        (make-mobile
                                          (make-branch 3 14)
                                          (make-branch 2
                                                       (make-mobile
                                                         (make-branch 3
                                                                      (make-mobile
                                                                        (make-branch 5 4)
                                                                        (make-branch 2 10)))
                                                         (make-branch 6 7)))))
                           (make-branch 25 7)))

(define simple-unbalanced (make-mobile
                            (make-branch 2
                                         (make-mobile
                                           (make-branch 2 6)
                                           (make-branch 9 2)))
                            (make-branch 4 4)))

; Exercise 3
; Balanced mobiles
; Torque = length x weight
; If left torque == right torque, then we're balanced
(define (balanced? mobile)
  (define (torque branch)
    (* (branch-length branch)
       (total-weight (branch-structure branch))))
  (if (not (pair? mobile))
      true
      (and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
           (balanced? (branch-structure (left-branch mobile)))
           (balanced? (branch-structure (right-branch mobile))))))

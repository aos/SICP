; Exercise 3.19
; Redo 'detect-cycle' using constant space

(define (make-cycle x)
  (define (last-pair x)
    (if (null? (cdr x))
        x
        (last-pair (cdr x))))
  (set-cdr! (last-pair x) x)
  x)

(define w (make-cycle (list 'a 'b 'c)))

(define (contains-cycle? x)
  (define (helper slow fast)
    (cond ((null? fast) #f)
          ((null? (cdr fast)) #f)
          ((eq? slow fast) #t)
          (else (helper (cdr slow)
                        (cddr fast)))))
  (and (pair? x)
       (helper x (cdr x))))

(contains-cycle? w) ; #t
(contains-cycle? '())
(contains-cycle? (list 'a 'b))
(contains-cycle? (list 'a 'b 'c))
(contains-cycle? (list 'a 'b 'c 'd))

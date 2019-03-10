; Exercise 3.18
; Write a procedure that examines a list and determines cycle

(define (make-cycle x)
  (define (last-pair x)
    (if (null? (cdr x))
        x
        (last-pair (cdr x))))
  (set-cdr! (last-pair x) x)
  x)

(define (detect-cycle x)
  (let ((tracked '()))
    (define (helper s)
      (cond ((not (pair? s)) #f)
            ((memq s tracked) #t)
            (else
              (begin
                (set! tracked (cons s tracked))
                (helper (cdr s))))))
    (helper x)))

(define w (make-cycle (list 'a 'b 'c)))
(detect-cycle w) ; #t
(detect-cycle (list 'a 'b 'a)) ; #f

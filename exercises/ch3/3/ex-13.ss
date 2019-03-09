; Exercise 3.13
; 'make-cycle'

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

; We create an infinite loop!
; If we try to do (last-pair z), we get stuck in an infinite loop

(car (cdr (cdr (cdr z)))) ; a

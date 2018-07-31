; Exercise 1.41
; Procedure 'double', takes a procedure of one argument as argument and returns
; a procedure that applies the original procedure twice

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

((double inc) 1) ; => 3, since we are applying 'inc' twice

((double inc) 5) ; 7

(((double (double double)) inc) 5) ; => 16 + 5 = 21

; Exercise 2.20
; Dotted-tail notation - aka arbitrary number of arguments

; Here 'f' takes two or more arguments, of which the rest is a list:
(define (f x y . z)
  (display x)
  (display y)
  (display z))

(f 1 2 3 4 5 6)
; x = 1
; y = 2
; z = (3 4 5 6)

; Here 'g' takes zero or more arguments
(define (g . w)
  (display w))

(g 1 2 3 4 5 6) ; (1 2 3 4 5 6)

; Using lambda notation:
(define f (lambda (x y . z)
            (display x)
            (display y)
            (display z)))

(define g (lambda w (display w)))

; Define 'same-parity' procedure, takes one or more integers and returns a list
; of all the arguments that have the same even-odd parity as the first argument
(define (same-parity x . z)
  (define (iter start first L)
    (cond ((= (length L) 0) start) 
          ((= (remainder first 2) (remainder (car L) 2))
           (iter
             (append start (list (car L)))
             first
             (cdr L)))
          (else (iter start first (cdr L)))))
  (iter '() x z))

; Reverse parity
; Build the list in reverse order, then reverse all in one go
(define (same-par-r x . z)
  (let ((yes? (if (even? x)
                  even?
                  odd?)))
  (define (iter items result)
    (if (null? items)
        (reverse result)
        (iter (cdr items) (if (yes? (car items))
                              (cons (car items) result)
                              result))))
  (iter z (list x))))

; Exercise 2.27
; 'deep-reverse'
; Modify 'reverse' such that it returns the list with its elements reversed and
; with all sublists deep-reversed as well

(define x
  (list (list 1 2) (list 3 4)))

x ; ((1 2) (3 4))
(reverse x) ; ((3 4) (1 2))
(deep-reverse x) ; ((4 3) (2 1))

(define (deep-reverse L)
  (cond ((null? L) L)
        ((not (pair? (car L)))
         (list (car (cdr L))
               (car L)))
        (else
          (list (deep-reverse (car (cdr L)))
                (deep-reverse (car L))))))

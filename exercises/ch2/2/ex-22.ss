; Exercise 2.22
; Re-writing 'square-list' iteratively

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

; The error is at (cons (square (car things)) answer) which prepends (creates a
; new list) of the squared item BEFORE the start

; Trying again by interchanging the arguments
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things)))))))

; This also doesn't work because it creates nested lists.

; Doing it appropriately now:
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer (list (square (car things)))))))
  (iter items '()))


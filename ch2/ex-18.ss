; Exercise 2.18
; Define 'reverse'

; Iterative
(define (reverse L)
  (define (iter curr L)
    (if (null? L)
        curr
        (iter (cons (car L) curr) (cdr L))))
  (iter '() L))

; Using append (recursive)
(define (reverse items)
  (if (null? (cdr items))
      items
      (append (reverse (cdr items))
              (list (car items)))))

; Expanding the second implementation on (list 3 4 5)
; (reverse (list 3 4 5))
; (append (reverse (list 4 5)) (list 3))
; (append (append (reverse (list 5)) (list 4)) (list 3))
; (append (append (list 5) (list 4)) (list 3))
; (append (list 5 4) (list 3))
; (5 4 3)

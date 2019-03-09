; Exercise 2.21
; 'square-list'
(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))

; Using map
(define (square-list L)
  (map (lambda (x) (* x x)) L))

(square-list (list 1 2 3 4 5))

; Not using map
(define (square-L items)
  (if (null? items)
      '()
      (cons (* (car items) (car items))
            (square-L (cdr items)))))

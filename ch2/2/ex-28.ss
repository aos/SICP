; Exercise 2.28
; 'fringe' procedure
; Tree -> list (left-to-right)

(define x
  (list (list 1 2) (list 3 4)))

(define y
  (list (list 1 2) (list 3 (list 4 5))))

(fringe x) ; (1 2 3 4)
(fringe y) ; (1 2 3 4 5)
(fringe (list x x)) ; (1 2 3 4 1 2 3 4)

(define (fringe tree)
  (define (iter t curr)
    (cond ((null? t) '())
          ((not (pair? t))
           (append curr (list t)))
          (else
            (append (iter (car t) curr)
                    (iter (cdr t) curr)))))
  (iter tree '()))

; Non-iterative
(define (fringe tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else
          (append (fringe (car tree))
                  (fringe (cdr tree))))))

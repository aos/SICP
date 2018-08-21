; Exercise 2.35
; 'count-leaves' using 'accumulate'
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))
(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append
                (enumerate-tree (car tree))
                (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x) 1)
                   (enumerate-tree t))))

(define tree (list 56 (list 99 (list 3 4)) (list 6 (list 8 9) 10)))
(count-leaves tree)

; Now if we don't use 'map', we can make it without 'enumerate-tree'
(define (count-leaves-without-map t)
  (accumulate (lambda (node acc-so-far)
                (+ acc-so-far
                   (cond ((null? node) 0)
                         ((not (pair? node)) 1)
                         (else
                           (count-leaves-without-map node)))))
              0
              t))

; Shuffle a list
(define (shuffle lst)
  (map cdr
       (sort
         (map (lambda (x) (cons (random 1.0) x)) lst)
         (lambda (x y) (< (car x) (car y))))))

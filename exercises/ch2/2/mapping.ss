; Mapping over lists

; 'scale-list' scales each number in a list given by a factor:
(define (scale-list items factor)
  (if (null? items)
      '()
      (cons (* (car items) factor)
            (scale-list (cdr items)
                        factor))))

(scale-list (list 1 2 3 4 5 6) 10); (10 20 30 40 50 60)

; Defining map
(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))

(map abs (list -10 2.5 -11.6 17)) ; (10 2.5 11.6 17)
(map (lambda (x) (* x x)) (list 1 2 3 4)) ; (1 4 9 16)

; Re-defining 'scale-list'
(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))

; List structure

; Note: the '() defines a nil value
(define my-list-1 (cons 1 (cons 2 (cons 3 (cons 4 '())))))

; Can also be represented like so:
(define one-thru-four (list 1 2 3 4))

(car one-thru-four) ; 1
(cdr one-thru-four) ; (2 3 4)
(car (cdr one-thru-four)) ; 2
(cons 10 one-thru-four) ; (10 1 2 3 4)

; list-ref - returns the n-th item of the list
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items)
                (- n 1))))

; length and null?
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

; Iterative length
(define (length items)
  (define (iter a count)
    (if (null? a)
        count
        (iter (cdr a)
              (+ 1 count))))
  (iter items 0))

; Append two lists
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
            (append (cdr list1)
                    list2))))

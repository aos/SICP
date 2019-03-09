; Expanding out an accumulation procedure
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op
                    initial
                    (cdr sequence)))))

(define add (lambda (x y) (+ x y)))
(define nums (list 1 2 3 4 5))

; This should return 15, essentially a sum of the sequence of numbers
(accumulate add 0 nums)

; Expand out the 'op' in accumulate with the 'add' procedure
; First expansion:
(add 1
     (accumulate add 0 (list 2 3 4 5)))

; Second to last
(add 1
     (add 2
          (add 3
               (add 4
                    (add 5 0)))))

; Based on this expansion, it looks like 'accumulate' folds starting from
; last item on the list (with initial) then consumes the call stack going
; backwards

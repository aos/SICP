; Linear recursive process
; Must keep track of entire "stack"
(define (factorial n)
  (if (= n 1)
    1
    (* n (factorial (- n 1)))))

; Iterative process
; Only keeps track of 3 variables at any given moment
(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
      product
      (iter (* counter product) 
            (+ ccounter 1))))
  (iter 1 1 n))


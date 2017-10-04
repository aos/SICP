; Exercise 1.11 -- 

; f(n) = {n, if n < 3
;         f(n - 1) + 2f(n - 2) + 3f(n - 3), if n ≥ 3

;; Recursive process
(define (recur n)
  (if (< n 3)
    n
    (+ 
      (recur (n - 1)) 
      (* 2 (recur (n - 2))) 
      (* 3 (recur (n - 3))))))

;; Iterative process
(define (eleven n)
  )

(define (ele-iter ))

;; Exercise 1.11 -- 

; f(n) = {n, if n < 3
;         f(n - 1) + 2f(n - 2) + 3f(n - 3), if n ≥ 3

; Recursive process
(define (recur n)
  (if (< n 3)
    n
    (+ (recur (- n 1)) 
       (* 2 (recur (- n 2))) 
       (* 3 (recur (- n 3))))))

; Iterative process
(define (eleven n)
  (define (helper i n1 n2 n3)
    (if (= n i) ; `i` is initialized with 3 => returns 4, f(3) = 4
      n3
      (helper (+ i 1)
              n2
              n3
              (+ n3
                 (* 2 n2)
                 (* 3 n1)))))
  (if (< n 3)
    n ; Returns 0, 1, 2
    (helper 3 1 2 4)))


;; Exercise 1.12 -- Pascal's triangle



; Exercise 1.19
; Logarithmic Fibonacci number algorithm
; Assume 'T' to be the special case of 'p = 0' and 'q = 1'
; Initial: (a b p q)
;          (1 0 0 1)

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (define (square n) (* n n))
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))    ; compute p'
                   (+ (* 2 p q) (square q))     ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

; Computing p' and q' can be found as such:
; Define a' and b' by applying the transformation once:
; a' = qb + qa + pa = (p + q)a + bq
; b' = qa + pb
;
; Now let's define a" and b" as the results of applying the transformation to a'
; and b'
; a" = qb' + qa' + pa' = (p + q)a' + b'q
;                      = (p + q)((p + q) * a + bq)
;                      = (p^2 + 2pq + 2q^2)a + (2pq + q^2)b
; b" = qa' + pb' = ... = (2pq + q^2)a + (p^2 + q^2)b
; Thus:
; p' = p^2 + q^2
; q' = (2pq + q^2)

; Exercise 3.57
; How many additions are performed when we compute the n-th Fibonacci number
; using the definition of 'fibs' based on the 'add-streams' procedure?

(define fibs
  (cons-stream
    0 (cons-stream
        1 (add-streams
            (stream-cdr fibs) fibs))))

; The number of additions performed is linear when using this procedure. As we
; compute (stream-cdr fibs) as well as fibs. The number of additions would be
; exponentially greater if we had implemented 'delay' as (lambda () <exp>)
; without memoization because we would re-compute every leaf node. Where as if
; we memoize, we would only need to compute things linearly in the number of n.

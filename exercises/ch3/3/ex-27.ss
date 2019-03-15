; Exercise 3.27
; Memoization

; Normal fibonacci procedure
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else
          (+ (fib (- n 1))
             (fib (- n 2))))))

; Memoized
(define memo-fib
  (memoize
    (lambda (n)
      (cond ((= n 0) 0)
            ((= n 1) 1)
            (else
              (+ (memo-fib (- n 1))
                 (memo-fib (- n 2))))))))

; Memoizer procedure
(define (memoize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((previously-computed-result (lookup x table)))
        (or previously-computed-result
            (let ((result (f x)))
              (insert! x result table)
              result))))))

; It computes the n-th fibonacci number linear to n because table lookup and
; insertion has linear runtime. After a few steps, all the values will be
; stored in the table

; The scheme would not work with '(memoize fib)' because not all 'fib's are
; wrapped in memoize.

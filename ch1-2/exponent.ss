;; Computing the exponential of a given number
;; Given a base `b` and a positive integer exponent `n`, compute `b^n`

; Linear recursive
(define (expt b n)
  (if (= n 0)
    1
    (* b (expt b (- n 1)))))

; Linear iterative
(define (expt b n)
  (define (helper counter total)
    (if (= counter n)
      total
      (helper (+ counter 1)
              (* total b))))
  (helper 0 1))

; Using successive squaring
(define (fast-expt b n)
  (define (square x) (* x x))
  (define (even? n) (= (remainder n 2) 0))

  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

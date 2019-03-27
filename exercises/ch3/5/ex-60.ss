; Exercise 3.60
; Multiplying series

(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1)
                  (stream-car s2))
               (add-streams (mul-series s1 s2)
                            (mul-streams (stream-cdr s1)
                                         (stream-cdr s2)))))

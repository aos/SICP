; Exercise 3.62

(define (div-series s1 s2)
  (if (eq? 0 (stream-car s2))
      (error "Constant term of s2 can't be 0")
      (mul-series s1 (reciprocal-series s2))))

(define tan-series (div-series sine-series cosine-series))

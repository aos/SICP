; Exercise 1.8 - Cube roots
; With internal definitions, using lexically scoped `x`

(define (cbrt x)
  (define (square y) (* y y))

  (define (better guess)
    (/ 
      (+ (/ x (square guess)) (* 2 guess)) 
      3))

  (define (is-good? guess)
    (< (abs (/ (- (better guess) guess)
              guess))
      0.001))

  (define (cbrt-iter guess)
    (if (is-good? guess)
      guess
      (cbrt-iter (better guess))))

  (cbrt-iter 1.0))

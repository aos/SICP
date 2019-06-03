; Exercise 5.2

(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))

(controller
  (assign product (const 1))
  (assign counter (const 1))

  test-counter
    (test (op >) (reg counter) (reg n))
    (branch (label fact-done))
    (assign product (op *) (reg product) (reg counter))
    (assign counter (op +) (reg counter) (const 1))
    (goto (label test-counter))
  fact-done)

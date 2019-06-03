; Exercise 5.3
; Newton's method to compute square roots

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(controller
  (assign x (op read))
  (assign guess (const 1.0))
  
  test-good-enough
    (assign t (op *) (reg guess) (reg guess)) ; square
    (assign s (op -) (reg t) (reg x))
    (test (op <) (reg s) (const 0)) ; absolute value
    (branch (label absolute-value))
  test-done
    (test (op <) (reg s) (const 0.001))
    (branch (label done))
  improve-guess
    (assign q (op /) (reg x) (reg guess))
    (assign p (op +) (reg guess) (reg q)) ; average
    (assign o (op /) (reg p) (const 2))   ; average
    (assign guess (reg o))
    (goto (label test-good-enough))
  absolute-value
    (assign y (op *) (reg s) (const -1))
    (assign s (reg y))
    (goto (label test-done))
  done

  (perform (op print) (reg guess)))

; Exercise 5.26 + 5.27

; tail-recursion in iterative vs. recursive factorial
(define (fact-iter n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

;; Iterative
; max stack depth = 10 --> constant space
; pushes = (n * 35) + 64

;; Recursive
; max stack depth = (n * 3) + 5 --> linear space
; pushes = (n * 32) - 16

; Exercise 4.35

(define (an-integer-between low high)
  (require (<= low high))
  (amb low
       (an-integer-between (+ 1 low) high)))

;; For Pythagorean triples:
(define (a-pythagorean-triple-between low high)
  (let ((i (an-integer-between low high)))
    (let ((j (an-integer-between i high)))
      (let ((k (an-integer-between j high)))
        (require (= (+ (* i i) (* j j))
                    (* k k)))
        (list i j k)))))

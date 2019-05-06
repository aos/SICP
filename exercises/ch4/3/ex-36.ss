; Exercise 4.36

; a. Using 'an-integer-starting-from is not an adequate way to generate
; arbitrary Pythagorean triples because we have no upper bound. The 'i'
; will never finish computing as we will continue trying (1 j k) forever.

(define (an-integer-starting-from n)
  (amb n
       (an-integer-starting-from (+ n 1))))

(define (a-pythagorean-triple)
  (let ((i (an-integer-starting-from 1)))
    (let ((j (an-integer-starting-from i)))
      (let ((k (an-integer-starting-from j)))
        (require (= (+ (* i i) (* j j))
                    (* k k)))
        (list i j k)))))

; b.
(define (an-integer-between low high)
  (require (<= low high))
  (amb low
       (an-integer-between (+ 1 low) high)))

(define (a-pythagorean-triple-greater-than low)
  (let ((k (an-integer-starting-from low)))
    (let ((i (an-integer-between low k)))
      (let ((j (an-integer-between i k)))
        (require (= (+ (* i i) (* j j))
                    (* k k)))
        (list i j k)))))

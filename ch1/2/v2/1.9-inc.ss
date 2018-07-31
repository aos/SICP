; Increment by 1
(define (inc a)
  (+ 1 a))

(define (dec a)
  (- a 1))

; Recursive process
(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

; Iterative process
(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))

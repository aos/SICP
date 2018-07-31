; Exercise 1.29 -> Define Simpson's Rule

(define (cube x) (* x x x))
(define (inc x) (+ x 1))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a (* k h))))
  (define (sim-term k)
    (* (cond ((or (= k 0) (= k n)) 1)
             ((even? k) 2)
             (else 4))
       (yk k)))
  (* (sum sim-term 0 inc n)
     (/ h 3)))

; Test
(simpson cube 0 1 100)
(simpson cube 0 1 1000)

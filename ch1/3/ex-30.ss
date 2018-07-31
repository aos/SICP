; Exercise 1.30 -- Iterative recursion sum procedure

(define (cube x) (* x x x))
(define (inc x) (+ x 1))

; Iterative recursive
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result 
        (iter (next a) (+ result (term a)))))
  (iter a 0))

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
(simpson cube 0 1.0 100) ; 0.250000000006
(simpson cube 0 1 1000) ; 1/4

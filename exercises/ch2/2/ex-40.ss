; Exercise 2.40
; 'unique-pairs'
; Given an integer 'n', generate a sequence of pairs (i, j) with '1 ≤ j < i ≤ n'
; Use 'unique-pairs' to simplify the definition of 'prime-sum-pairs'

; Library functions
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
            (enumerate-interval (+ low 1) high))))

(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor n test-divisor)
      (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor n (+ test-divisor 1)))))
    (find-divisor n 2))
  (define (divides? a b)
    (= (remainder b a) 0))
  (if (= n 1) #f (= n (smallest-divisor n))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair)
        (cadr pair)
        (+ (car pair) (cadr pair))))

; Define 'unique-pairs'
(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j)
             (list i j))
           (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

; Simplify 'prime-sum-pairs' using 'unique-pairs'
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

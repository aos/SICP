; Nested mappings

; Library functions
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
            (enumerate-interval
              (+ low 1)
              high))))

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

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

; Problem: Given a positive integer 'n', find all ordered pairs of distinct
; postive integers 'i' and 'j', where '1 ≤ j < i ≤ n', such that 'i + j' is
; prime.

; Example: n = 6
;
;   i   | 2  3  4  4  5  6  6
;   j   | 1  2  1  3  2  1  5
; ---------------------------
; i + j | 3  5  5  7  7  7  11

; Organizing the computation:
; 1. Generate the sequence of all ordered pairs of positive integers ≤ n
; 2. Filter to select the pair whos sume is prime
; 3. For each pair that passes the filter, produce the triple (i, j, i + j)

; Generating the sequence of pairs:
; 1. Enumerate the integers i ≤ n
; 2. Enumerate the integers j < i
; 3. Generate pair

(accumulate
  append
  '()
  (map (lambda (i)
         (map (lambda (j) (list i j))
              (enumerate-interval 1 (- i 1))))
       (enumerate-interval 1 6)))

; The above is a common procedure, so we will separate into its own proc
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

; The filter procedure
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

; Generate sequence of results by mapping over the filtered pair, which output a
; triple consisting of the two elements of the pair along with their sum
(define (make-pair-sum pair)
  (list (car pair)
        (cadr pair)
        (+ (car pair) (cadr pair))))

; Final procedure:
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter
         prime-sum?
         (flatmap
           (lambda (i)
             (map (lambda (j)
                    (list i j))
                  (enumerate-interval
                    1
                    (- i 1))))
           (enumerate-interval 1 n)))))

; Generate all permutations of a set S
; For each item 'x' in S, recursively generate the sequence of permutations of
; 'S - x', and adjoin 'x' to the front of each one
(define (permutations s)
  (if (null? s)
      (list '())
      (flatmap (lambda (x)
                 (map (lambda (p)
                        (cons x p))
                      (permutations
                        (remove x s))))
               s)))

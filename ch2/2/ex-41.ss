; Exercise 2.41
; Define a procedure to find all ordered triples of distinct positive integers
; 'i', 'j', and 'k' less than or equal to a given integer 'n' that sum to a
; given integer 's'

; Library functions
(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
            (enumerate-interval (+ low 1) high))))

(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j)
             (list i j))
           (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

; Defining the main procedure
(define (ordered-triples s n)
  (filter
    (lambda (triple) (= (fold-right + 0 triple) s))
    (flatmap (lambda (i)
               (map (lambda (pair)
                      (cons i pair))
                    (unique-pairs (- i 1))))
             (enumerate-interval 1 n))))

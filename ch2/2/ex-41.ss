; Exercise 2.41
; Define a procedure to find all ordered triples of distinct positive integers
; 'i', 'j', and 'k' less than or equal to a given integer 'n' that sum to a
; given integer 's'

(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))

(define (triple-sum? triple s)
  (= s
     (+ (car triple)
        (cadr triple)
        (caddr triple))))

(define (ordered-triples n s))

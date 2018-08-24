; Exercise 2.36
; 'accumulate-n'
; Similar to 'accumulate' but takes as its third argument a sequence of
; sequences, all assumed to have the same # of elements
; Applies the designated accumulation procedure to combine all the first, all
; the second, and so on, and returns a sequence of the results

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

; Ex: ((1 2 3) (4 5 6) (7 8 9) (10 11 12))
; (accumulate-n + 0 s) => (22 26 30) 

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define x (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
; Test out solution
(accumulate-n + 0 x)

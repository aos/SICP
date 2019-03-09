; Exercise 2.33
; Define some basic list-manipulation operations as accumulations

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

; The 'op' in 'accumulate' can effectively be substituted with a 'lambda'
; function that has two parameters:
; The first parameter will be the first/current part of the sequence (car),
; the second parameter will be the rest of the procedure, ultimately starting at
; 'initial'

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) 
              '()
              sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y))
              0
              sequence))

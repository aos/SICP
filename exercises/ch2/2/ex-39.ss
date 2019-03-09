; Exercise 2.39
; 'reverse' in terms of 'fold-right' and 'fold-left'

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

; fold-right
; Starts with the initial and applies it to the last element (right) first
; Argument positions for lambda (current accumulator)
(fold-right - 0 (list 1 2 3 4))
(- 1 (- 2 (- 3 (- 4 0))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

; fold-left
; Starts with the initial and applies it to the first element (left) first
; Argument positions for lambda (accumulator current)
(fold-left / 1 (list 1 2 3 4))
(/ (/ (/ (/ 1 1) 2) 3) 4)

; Define 'reverse'
(define (reverse sequence)
  (fold-right
    (lambda (curr acc) (append acc (list curr))) '() sequence))

(define (reverse sequence)
  (fold-left
    (lambda (acc curr) (cons curr acc)) '() sequence))

(reverse (list 1 2 3))

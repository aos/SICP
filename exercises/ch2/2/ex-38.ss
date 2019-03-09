; Exercise 2.38
; 'fold-right' and 'fold-left'

; Our 'accumulate' procedure is AKA 'fold-right' because it combines the first
; element of the sequence with the result of combining all the elements to the
; right
; 'fold-left' does things in the opposite direction

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-left - 1 (list 1 2 3)) ; (- (- (- 1 1) 2) 3)
(fold-right - 1 (list 1 2 3)) ; (- 1 (- 2 (- 3 1)))

; Expand 'fold-left'
; result = 1
; op = /
(iter 1 (list 1 2 3))
(iter (/ 1 1) (list 2 3))
(iter (/ 1 2) (list 3))
(iter (/ (/ 1 2) 3) '())

(fold-right list '() (list 1 2 3))
(fold-left list '() (list 1 2 3))

; The operation must be 'commutative': changing the order of the operands does
; not change the result.

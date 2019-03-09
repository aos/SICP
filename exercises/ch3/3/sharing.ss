; Sharing and identity

(define x (list 'a 'b))
(define z1 (cons x x))
(define z2 (cons (list 'a 'b) (list 'a 'b)))

(define (set-to-wow! l)
  (set-car! (car l) 'wow)
  l)

(set-to-wow! z1) ; ((wow b) wow b)
; This is because the 'car' and 'cdr' are the same pair

(set-to-wow! z2) ; ((wow b) a b)

; To detect sharing in list structures use 'eq?'
(eq? (car z1) (cdr z1)) ; #t
(eq? (car z2) (cdr z2)) ; #f

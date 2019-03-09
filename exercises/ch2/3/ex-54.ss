; Exercise 2.54
; Define 'equal?'
; Example:
(equal? '(this is a list)
        '(this is a list)) ; true

(equal? '(this is a list)
        '(this (is a) list)) ; false

; This only works for lists
(define (equal? x y)
  (cond ((and (null? x) (null? y)) true)
        ((not (eq? (car x) (car y))) false)
        (else (equal? (cdr x) (cdr y)))))

; Expanding on it to include numbers and just symbols
(define (equal? a b)
  (or
    (eq? a b)
    (and
      (pair? a)
      (pair? b)
      (equal? (car a) (car b))
      (equal? (cdr a) (cdr b)))))


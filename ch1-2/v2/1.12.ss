; Ex: 1.12 -> Pascal's triangle
;
;        1    n = 0
;       1 1       1
;      1 2 1      2
;     1 3 3 1     3
;    1 4 6 4 1    4
;       ...

; Given row and column, compute that element of Pascal's triangle.
(define (pascal r c)
  (cond 
    ((= c 0) 0)
    ((= r 0) 1)

  ))

; Ex: 1.12 -> Pascal's triangle
; Given row and column, compute that element of Pascal's triangle
;
;        1        r = 0
;       1 1           1
;      1 2 1          2
;     1 3 3 1         3
;    1 4 6 4 1        4
;
;c = 0 1 2 3 4

(define (pascal r c)
  (cond 
    ((= r 0) 1) ; Root
    ((or (= c 0) (= c r)) 1) ; Edges of triangle
    (else (+
            (pascal (- r 1) (- c 1)) ; Left side
            (pascal (- r 1) c))))) ; Right side

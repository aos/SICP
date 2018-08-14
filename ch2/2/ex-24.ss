; Exercise 2.24

(list 1 (list 2 (list 3 4))) ; (1 (2 (3 4)))

; [ x | x ]
;   |   |
;   v   v
;  [1][ x | / ]
;       |
;       v
;     [ x | x ]
;       |   |
;       v   v
;      [2][ x | / ]
;           |   
;           v   
;         [ x | x ]
;           |   |
;           v   v
;          [3][ x | / ]
;               |
;               v
;              [4]

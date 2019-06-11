; Exercise 2.42 - xxx (REVISIT)
; Eight queens puzzle

; Library functions
(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
            (enumerate-interval (+ 1 low) high))))

; Define 'empty-board'
; In our case, an empty board could be represented as an empty list
(define empty-board '())

; Define 'safe?'
; Determines for a set of positions, whether the queen in the kth column is safe
; with respect to the others
(define (safe? column positions)
  (let ((trial (car positions))
        (trial-row (caar positions))
        (trial-col (cadar positions))
        (rest (cdr positions)))
    (fold-right (lambda (pos result)
                  (let ((row (car pos))
                        (col (cadr pos)))
                    (and (not (= (- trial-row trial-col)
                                 (- row col)))
                         (not (= (+ trial-row trial-col)
                                 (+ row col)))
                         (not (= trial-row row))
                         result)))
                true
                rest)))

(define (safe? column positions) #t)

; Define 'adjoin-position'
; Adjoins a new row-column position to a set of positions
(define (adjoin-position new-row column rest-of-queens)
  (cons (list new-row column) rest-of-queens))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      ; 3. Filter all the queens placed on each row of the 'kth' column,
      ; such that it is safe with respect to all other queens
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            ; 2. Generate a new set of positions by placing a queen in each
            ; row of the 'kth' column
            (map (lambda (new-row)
                   (adjoin-position
                     new-row
                     k
                     rest-of-queens))
                 (enumerate-interval 1 board-size)))
          ; 1. Generate all possible ways to place 'k - 1' queens in first
          ; 'k - 1' columns
          (queen-cols (- k 1)))))) ; -> (1 1)
  (queen-cols board-size))

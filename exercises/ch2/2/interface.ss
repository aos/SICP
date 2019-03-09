; Sequences as Conventional Interfaces

; Sum odd squares of a tree
(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree))
         (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares
                   (car tree))
                 (sum-odd-squares
                   (cdr tree))))))

; List of all even Fibonoacci numbers Fib(k),
; where 'k' is <= a given integer 'n'
(define (even-fibs n)
  (define (next k)
    (if (> k n)
        '()
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))

; Organize our programs by concentrating on the "signals" that flow from one
; stage in the process to the next

;; 'sum-odd-squares'
; [enumerate: leaves] -> [filter: odd?] -> [map: square] -> [accumulate: +, 0]
;; 'even-fibs'
; [enumerate: ints] -> [map: fib] -> [filter: even?] -> [accumulate: cons, ()]

; Defining our filter procedure
(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate
                       (cdr sequence))))
        (else  (filter predicate
                       (cdr sequence)))))

; For example:
(filter odd? (list 1 2 3 4 5 6 7))

; Defining accumulations:
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

; Examples:
(accumulate + 0 (list 1 2 3 4 5))
(accumulate * 1 (list 1 2 3 4 5))
(accumulate cons '() (list 1 2 3 4 5))

; Enumeration:
(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
            (enumerate-interval
              (+ low 1)
              high))))

(enumerate-interval 2 7) ; (2 3 4 5 6 7)

; Enumerate leaves of a tree
(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append
                (enumerate-tree (car tree))
                (enumerate-tree (cdr tree))))))

(enumerate-tree (list 1 (list 2 (list 3 4)) 5)) ; (1 2 3 4 5)

; Now let's reformulate our procedures as in the signal-flow diagrams
(define (sum-odd-squares tree)
  (accumulate +
              0
              (map square 
                   (filter odd? 
                           (enumerate-tree tree)))))

; Get our fibonacci sequence out
(define (fib n)
  (define (iter a b count)
    (if (= 0 count)
        a
        (iter b 
              (+ a b)
              (- count 1))))
  (iter 0 1 n))

; Redefine 'even-fibs'
(define (even-fibs n)
  (accumulate cons
              '()
              (filter even?
                      (map fib
                           (enumerate-interval 0 n)))))

; Modular design is paramount!!
(define (list-fib-squares n)
  (accumulate cons
              '()
              (map square
                   (map fib
                        (enumerate-interval 0 n)))))

; Now more complex:
(define (product-of-squares-of-odd-elements sequence)
  (accumulate *
              1
              (map square (filter odd? sequence))))

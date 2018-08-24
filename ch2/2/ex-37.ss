; Exercise 2.37
; Matrix algebra

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

; Represent vectors as lists
(define v-list (list 1 2 3))
(define w-list (list 4 5 6))
; Represent matrices as lists of lists:
(define m-mat (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

; Dot product
; Note: this is the extended definition of 'map'
; which takes in a procedure of 'n' arguments, together with 'n' lists and
; applies the procedure to all the first, second, and rest of elements
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; The multiplication occurring here would be:
; (1 * 4), (2 * 5), (3 * 6)
(map * v-list w-list) ; => (4 10 18)

; Then we sum over the new list returned from 'map'
(dot-product v-list w-list) ; => 32

; A. Defining matrix-*-vector
(define (matrix-*-vector m v)
  (map
    (lambda (m-vec) (dot-product m-vec v))
    m))

; Test
(matrix-*-vector m-mat v-list)

; B. Defining matrix transposition
(define (transpose mat)
  (accumulate-n cons '() mat)) 

; Test
(transpose m-mat)

; C. Defining matrix multiplication
(define (matrix-*-matrix m n)
  (let ((n-cols (transpose n)))
    (map
      (lambda (m-row) (matrix-*-vector n-cols m-row))
      m)))

; Test
(matrix-*-matrix m-mat m-mat)

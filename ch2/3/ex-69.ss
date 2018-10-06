; Exercise 2.69
; Generate a huffman tree given a set of pairs

;; But first, some library functions:
; Leaf functions
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
; Tree functions
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left)
                (symbols right))
        (+ (weight left) (weight right))))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
; Creating the leaf-set
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set)))
         (cons x set))
        (else
          (cons (car set)
                (adjoin-set x (cdr set))))))
(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set
          (make-leaf (car pair) ; symbol
                     (cadr pair)) ; frequency
          (make-leaf-set (cdr pairs))))))

(define some-pairs '((a 4) (b 2) (c 1) (d 1)))
(define pair-set (make-leaf-set some-pairs))

; The procedure that we'll be calling
(define (generate-huffman-tree pairs)
  (successive-merge
    (make-leaf-set pairs)))

; The procedure that we need to make
(define (successive-merge leaves-set)
  ((make-code-tree
     (car leaves-set)
     (make-code-tree
       (cdr leaves-set)))))

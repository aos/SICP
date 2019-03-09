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

; A pair set looks like:
; ((leaf d 1) (leaf c 1) (leaf b 2) (leaf a 4))

; The procedure that we need to make
; Note: since the left or right branch are arbitrary, this will use the right
; branch as the normal 'leaf' branch
; It will pick off the first and second leaves to create our initial 'mini' tree
; and then fold the rest into it
(define (successive-merge leaves-set)
  (let ((len (length leaves-set)))
    (cond ((= len 0) (error
                       "SUCCESSIVE-MERGE:
                       zero pairs were provided"))
          ((= len 1) (car leaves-set))
          (else
            (fold-left make-code-tree
                       (make-code-tree (car leaves-set)
                                       (cadr leaves-set))
                       (cddr leaves-set))))))

; Alternative solution
(define (successive-merge leaves-set)
  (if (= (length leaves-set) 1)
      (car leaves-set)
      (let ((first (car leaves-set))
            (second (cadr leaves-set))
            (rest (cddr leaves-set)))
      (successive-merge (adjoin-set (make-code-tree first second)
                                    rest)))))

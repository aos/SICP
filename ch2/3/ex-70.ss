; Exercise 2.70
; Generate a huffman tree for the following:
; Then encode it

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
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
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

(define (generate-huffman-tree pairs)
  (successive-merge
    (make-leaf-set pairs)))

; Incorrect first attempt at successive-merge
; This only successively adds the nodes to the tree but does not take into
; account when joined nodes can have a sum weight less than larger nodes
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

; Alternative successive-merge
; Note: this is the correct implementation of successive-merge
; We use 'adjoin-set' to correctly place the joined nodes into the set based on
; their weight
(define (successive-merge leaves-set)
  (if (= (length leaves-set) 1)
      (car leaves-set)
      (let ((first (car leaves-set))
            (second (cadr leaves-set))
            (rest (cddr leaves-set)))
      (successive-merge (adjoin-set (make-code-tree first second)
                                    rest)))))
(define (encode message tree)
  (if (null? message)
      '()
      (append
        (encode-symbol (car message)
                       tree)
        (encode (cdr message) tree))))
(define (encode-symbol sym tree)
  (cond ((leaf? tree) '())
        ((memq sym (symbols (left-branch tree)))
         (cons 0
               (encode-symbol sym
                              (left-branch tree))))
        ((memq sym (symbols (right-branch tree)))
         (cons 1
               (encode-symbol sym
                              (right-branch tree))))
        (else (error "symbol not in tree:
                     ENCODE-SYMBOL" sym))))

; Our symbols:
(define lyrics '((a 2) (boom 1) (get 2) (job 2) (na 16) (sha 3) (yip 9) (wah 1)))

(define rock-tree (generate-huffman-tree lyrics))
(define message '(get a job sha na na na na na na na na get a job sha na na na na na na na na wah yip yip yip yip yip yip yip yip yip sha boom))

(encode message rock-tree)

; The least amount of bits required is 84 (87?)
; How many bits needed to encode if fixed-length code?
; There are 8 words -- so... 2^3 = 8, need to use 3 bit fixed-length codes
; There are 36 words * 3 bits each = 90 + 18 = 108 bits
; A saving of around 22% !
; 

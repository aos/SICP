; Exercise 2.68
; 'encode' procedure
; Takes as argument a message and a tree
; Produces the list of bits that gives the encoded message

;; Library
; Leaf selectors
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))
; Tree selectors
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
; Branch selector
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit:
                     CHOOSE-BRANCH" bit))))

;; Encode procedure
(define (encode message tree)
  (if (null? message)
      '()
      (append
        (encode-symbol (car message)
                       tree)
        (encode (cdr message) tree))))

; Define 'encode-symbol'
; Parameters: list of symbols, tree
; Returns the list of bits that encodes a given symbol according to a given tree
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

; Exercise 2.72
; Order of growth for 'encode'

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

; Order of growth in number of steps needed to encode a single symbol:
; 1. Search the symbol list at each node: n symbols
; 2. Then log n branches taken
; Total: n * log n

; For the special case described in 2.71
; 1. Encoding the most frequent symbol:
;   - Search through symbol list: n
;   - Take a single branch: constant
;   - Total: n
; 2. Encoding the least frequent symbol:
;   - Search through symbol list at each level: n
;   - Take the next branch, n - 1
;   - Total: n^2

; Exercise 4.42

(define (xor p q)
  (if p (not q) q))

(define (lier)
  (let ((betty (amb 1 2 3 4 5))
        (ethel (amb 1 2 3 4 5))
        (joan (amb 1 2 3 4 5))
        (kitty (amb 1 2 3 4 5))
        (mary (amb 1 2 3 4 5)))
    (require (xor (= kitty 2) (= betty 3)))
    (require (xor (= ethel 1) (= joan 2))
             (xor (= joan 3) (= ethel 5))
             (xor (= kitty 2) (= mary 4))
             (xor (= mary 4) (= betty 1)))
    (require (distinct? (list betty ethel joan
                              kitty mary)))
    (list (list 'betty betty)
          (list 'ethel ethel)
          (list 'joan joan)
          (list 'kitty kitty)
          (list 'mary mary))))

; ((betty 3) (ethel 5) (joan 2) (kitty 1) (mary 4))

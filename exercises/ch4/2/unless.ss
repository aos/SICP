; Unless

(define (unless condition
                usual-value
                exceptional-value)
  (if condition
      exceptional-value
      usual-value))

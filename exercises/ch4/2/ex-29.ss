; Exercise 4.29

; 1. With memoization:
(square (id 10)) ; 100
count ; 1 -> because we already evaluated (id 10) once, and thus is now an
; evaluated-thunk

; 2. Without memoization
(define (force-it obj)
  (if (thunk? obj)
      (actual-value (thunk-exp obj) (thunk-env obj))
      obj))

(square (id 10)) ; 100
count ; 2

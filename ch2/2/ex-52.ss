; Exercise 2.52 -- unnecessary
; Make changes to square limit of 'wave' by working at each levels described:
; 1. Add segments to the primitive 'wave' painter
; 2. Change pattern constructed by 'corner-split'
;    (using only one copy of 'up-split' and 'right-split' instead of 2)
; 3. Modify 'square-limit' that uses 'square-of-four' so as to assemble the
; corners in a different pattern

; 1.
(define wave
  (segments->painter (list
                       ;; ...
                       (make-segment
                         (make-vect 0.44 0.7)
                         (make-vect 0.51 0.7)))))

; 2.
(define (corner-split painter n)
  (if (= n 0)
      (painter
      (beside (below painter (up-split painter n))
              (below (right-split painter n)
                     (corner-split painter (- n 1)))))))

; 3.
(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-vert
                                  rotate180
                                  identity
                                  flip-horiz)))
    (combine4 (corner-split painter n))))

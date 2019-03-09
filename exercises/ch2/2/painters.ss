; Drawing 'painters'

(define wave2 (beside wave (flip-vert wave)))
(define wave4 (below wave2 wave2))

; Abstracting away the pattern in 'wave4'
(define (flipped-pairs painter)
  (let ((painter2
          (beside painter
                  (flip-vert painter))))
    (below painter2 painter2)))

(define wave4 (flipped-pairs wave))

; And recursive operations
; Procedure that makes painters split and branch towards the right
(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter
                (below smaller smaller)))))

; 'corner-split'
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

; By placing 4 copies of a 'corner-split' appropriately, we obtain a pattern
; called the 'square-limit'
(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter)
                        quarter)))
      (below (flip-vert half) half))))

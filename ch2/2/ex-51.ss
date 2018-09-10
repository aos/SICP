; Exercise 2.51
; Define 'below' operation
; Define in 2 different ways:
; 1. analogous to 'beside'
; 2. using 'beside' and a suitable rotation

; 1.
(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-above (transform-painter
                         painter1
                         split-point
                         (make-vect 1.0 0.5)
                         (make-vect 0.0 1.0)))
          (paint-below (transform-painter
                         painter2
                         (make-vect 0.0 0.0)
                         (make-vect 1.0 0.0)
                         split-point)))
      (lambda (frame)
        (paint-above frame)
        (paint-below frame)))))

; 2.
(define (below painter1 painter2)
  (rotate90 (beside
              (rotate270 painter1)
              (rotate270 painter2))))

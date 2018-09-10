; Exercise 2.50
; Define 'flip-horiz', 'rotate180-cc' and 'rotate270-cc'

(define (transform-painter
          painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame new-origin
                             (sub-vect (m corner1)
                                       new-origin)
                             (sub-vect (m corner2)
                                       new-origin)))))))

; 'flip-horizon'
(define (flip-horiz painter)
  (transform-painter
    painter
    (make-vect 1.0 0.0)   ; new origin
    (make-vect 0.0 0.0)   ; new end of edge1
    (make-vect 1.0 1.0))) ; new end of edge2

; 'rotate180-cc'
(define (rotate180 painter)
  (transform-painter
    painter
    (make-vect 1.0 1.0)
    (make-vect 0.0 1.0)
    (make-vect 1.0 0.0)))

; 'rotate270-cc'
(define (rotate270 painter)
  (transform-painter
    painter
    (make-vect 0.0 1.0)
    (make-vect 0.0 0.0)
    (make-vect 1.0 1.0)))

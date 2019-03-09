; Transforming and combining painters

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

; Flipping painter images vertically
(define (flip-vert painter)
  (transform-painter
    painter
    (make-vect 0.0 1.0)   ; new origin
    (make-vect 1.0 1.0)   ; new end of edge1
    (make-vect 0.0 0.0))) ; new end of edge2

; Shrink images to the upper-right quarter of the frame
(define (shrink-to-upper-right painter)
  (transform-painter painter
                     (make-vect 0.5 0.5)
                     (make-vect 1.0 0.5)
                     (make-vect 0.5 1.0)))

; Rotate images counterclockwise by 90 degrees
(define (rotate90 painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

; Squash towards center of the frame
(define (squash-inwards painter)
  (transform-painter painter
                     (make-vect 0.0 0.0)
                     (make-vect 0.65 0.35)
                     (make-vect 0.35 0.65)))

; Frame transformation for combination of painters
(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left (transform-painter
                        painter1
                        (make-vect 0.0 0.0)
                        split-point
                        (make-vect 0.0 1.0)))
          (paint-right (transform-painter
                         painter2
                         split-point
                         (make-vect 1.0 0.0)
                         (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

; Frames and their associated vectors

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
      (origin-frame frame)
      (add-vect
        (scale-vect (xcor-vect v)
                    (edge1-frame frame))
        (scale-vect (ycor-vect v)
                    (edge2-frame frame))))))

; Applying 'frame-coord-map' to a frame returns a proc that, given a vector,
; returns a vector. If the argument vector is in the unit square, the result
; vector will be in the frame

((frame-coord-map a-frame) (make-vect 0 0))
; Returns same vector as
(origin-frame a-frame)

; Painters
; Procedure that -- give a frame as an arg -- draws a particular image shifted
; and scaled to fit the frame. If 'p' is a painter and 'f' is a frame, then we
; produce p's image in 'f' by calling 'p' with 'f' as argument

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame)
           (start-segment segment))
          ((frame-coord-map frame)
           (end-segment segment))))
      segment-list)))

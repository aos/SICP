; Exercise 2.49
; Use 'segments->painter' to define the following primitive painters:
; 1. Painter that draws the outline of the designated frame
; 2. Painter that draws an X by connecting opposite corners of the frame
; 3. Painter that draws a diamond shape by connecting midpoints of the sides of
;    the frame
; 4. 'wave' painter

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

; 1. Outline the designated frame
(define outline (list
                  (make-segment
                    (make-vect 0 0)
                    (make-vect 0 1)) 
                  (make-segment
                    (make-vect 0 1)
                    (make-vect 1 1))
                  (make-segment
                    (make-vect 1 1)
                    (make-vect 1 0))
                  (make-segment
                    (make-vect 1 0)
                    (make-vect 0 0))))

(segments->painter outline)

; 2. Draw an X by connecting opposite corners of the frame
(define x-corners (list
                    (make-segment
                      (make-vect 0 0)
                      (make-vect 1 1))
                    (make-segment
                      (make-vect 1 0)
                      (make-vect 0 1))))

(segments->painter x-corners)

; 3. Diamond shape -- connect midpoints of the sides of the frame
(define diamond (list
                  (make-segment
                    (make-vect 0.5 0)
                    (make-vect 1 0.5))
                  (make-segment
                    (make-vect 1 0.5)
                    (make-vect 0.5 1))
                  (make-segment
                    (make-vect 0.5 1)
                    (make-vect 0 0.5))
                  (make-segment
                    (make-vect 0 0.5)
                    (make-vect 0.5 0))))

(segments->painter diamond)

; 4. 'wave' painter (Revisit)

; Delayed evaluation with streams

(define (integral
          delayed-integrand initial-value dt)
  (define int
    (cons-stream
      initial-value
      (let ((integrand
              (force delayed-integrand)))
        (add-streams
          (scale-stream integrand dt)
          int))))
  int)

(define (solve f y0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (stream-map f y))
  y)

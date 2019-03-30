; Streams as signals

(define (integral integrand init dt)
  (define int
    (cons-stream
      init
      (add-streams (scale-stream integrand dt)
                   int)))
  int)

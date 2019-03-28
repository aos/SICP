; Exercise 3.64
; 'stream-limit'

(define (stream-limit stream tolerance)
  (if (<= (abs (- (stream-ref stream 0)
                  (stream-ref stream 1)))
          tolerance)
      (stream-ref stream 1)
      (stream-limit (stream-cdr stream) tolerance)))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

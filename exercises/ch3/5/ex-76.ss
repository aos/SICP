; Exercise 3.76

(define (smooth stream)
  (let ((val1 (stream-car stream))
        (val2 (stream-car (stream-cdr stream))))
    (cons-stream
      (/ (+ val1 val2) 2)
      (smooth (stream-cdr stream)))))

(define (make-zero-crossings input-stream)
  (stream-map sign-change-detector
              input-stream))

(define (smoothed-zero-crossings input-stream)
  (make-zero-crossings (smooth input-stream)))

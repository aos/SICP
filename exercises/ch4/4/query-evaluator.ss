; Query Evaluator

(define (qeval query frame-stream)
  (let ((qproc (get (type query) 'qeval)))
    (if qproc
        (qproc (contents query) frame-stream)
        (simple-query query frame-stream))))

(define (simple-query query-pattern frame-stream)
  (stream-flatmap
    (lambda (frame)
      ; stream 1 and 2 combined
      (stream-append-delayed
        ; Match pattern against all assertions (stream 1 - extended frames)
        (find-assertions query-pattern frame)
        ; Apply all possible rules (stream 2 - extended frames)
        (delay
          (apply-rules query-pattern frame))))
    frame-stream))

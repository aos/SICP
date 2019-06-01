; Exercise 4.75

(define (unique-query exps) (car exps))

(define (uniquely-asserted operands frame-stream)
  (stream-flatmap
    (lambda (frame)
      (let ((stream (qeval (unique-query operands)
                           (singleton-stream frame))))
        (if (singleton-stream? stream)
            stream
            the-empty-stream)))
    frame-stream))

(define (singleton-stream? s)
  (and (not (stream-null? s))
       (stream-null? (stream-cdr s))))

(put 'unique 'qeval uniquely-asserted)

; Exercise 4.75

(define (unique-query exp) (car exp))

(define (uniquely-asserted operands frame-stream)
  (stream-flatmap
    (lambda (frame)
      (let ((q (qeval (unique-query frame))))))
    frame-stream))

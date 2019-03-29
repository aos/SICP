; Exercise 3.69
; 'triples'

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream 
       (stream-car s1)
       (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream
    (list (stream-car s) (stream-car t))
    (interleave
      (stream-map (lambda (x)
                    (list (stream-car s) x))
                  (stream-cdr t))
      (pairs (stream-cdr s)
             (stream-cdr t)))))

(define (triples s1 s2 s3)
  (cons-stream
    (list (stream-car s1) (stream-car s2) (stream-car s3))
    (interleave
      (stream-map (lambda (t)
                    (cons (stream-car s1) t))
                  (stream-cdr (pairs s2 s3)))
      (triples (stream-cdr s1)
               (stream-cdr s2)
               (stream-cdr s3)))))

;; Generate the Pythagorean triples
(define py-trips
  (stream-filter
    (lambda (t)
      (= (+ (square (car t))
            (square (cadr t)))
         (square (caddr t))))
    (triples integers integers integers)))

; Exercise 3.52

; memoizing
(define (memo-proc proc)
  (let ((already-run? #f)
        (result #f))
    (lambda ()
      (if (not already-run?)
          (begin (set! result (proc))
                 (set! already-run? #t)
                 result)
          result))))

; re-defining delay:
(define (delay e) (memo-proc (lambda () e)))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream
        (proc (stream-car s))
        (stream-map proc (stream-cdr s)))))

(define (stream-filter pred stream)
  (cond ((stream-null? stream) 
         the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream 
          (stream-car stream)
          (stream-filter 
           pred
           (stream-cdr stream))))
        (else (stream-filter 
               pred 
               (stream-cdr stream)))))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1)
                                  high))))

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin
        (proc (stream-car s))
        (stream-for-each proc
                         (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each (lambda (x)
                     (newline)
                     (display x))
                   s))

;;
(define sum 0)
(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq
  (stream-map
    accum
    (stream-enumerate-interval 1 20)))
; sum => 1
  
(define y (stream-filter even? seq))
; sum => 1

(define z
  (stream-filter
    (lambda (x)
      (= (remainder x 5) 0)) seq))
; sum => 10

(stream-ref y 7)
(display-stream z)

; If we had not memoized the results, 'display-stream' would need to
; re-evaluate what 'stream-ref' did.

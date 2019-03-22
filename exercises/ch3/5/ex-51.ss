; Exercise 3.51

(define (force delayed-object)
  (delayed-object))

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

(define the-empty-stream '())

(define (stream-null? s)
  (null? s))

(define (cons-stream a b)
  (cons a (delay b)))

(define (stream-car stream)
  (car stream))

(define (stream-cdr stream)
  (force (cdr stream)))

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

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1)
                                  high))))

(define (display-line x)
  (newline)
  (display x))

;;
(define (show x)
  (display-line x)
  x)

(define x
  (stream-map
    show
    (stream-enumerate-interval 0 10)))

(stream-ref x 5)
(stream-ref x 7)

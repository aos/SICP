; Streams

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

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin
        (proc (stream-car s))
        (stream-for-each proc
                         (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each (lambda (x)
                     ((newline)
                      (display x)))
                   s))

; cons, car and cdr
(define (cons-stream a b)
  (cons a (delay b)))

(define (stream-car stream)
  (car stream))

(define (stream-cdr stream)
  (force (cdr stream)))

; force and delay

; 'delay' can be syntactic sugar for:
; (define (delay <exp>)
;   (lambda () <exp>))

; where as 'force' can just call this procedure:
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

; then re-defining delay:
(define (delay e)
  (memo-proc (lambda () e)))

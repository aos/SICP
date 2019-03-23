; Infinite streams

(define (integers-starting-from n)
  (cons-stream
    n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))

(define (divisible? x y) (= (remainder x y) 0))
(define no-sevens
  (stream-filter (lambda (x)
                   (not (divisible? x 7)))
                 integers))

(stream-ref no-sevens 100)

; Delayed fibonacci
(define (fibgen a b)
  (cons-stream a (fibgen b (+ a b))))
(define fibs (fibgen 0 1))

; Sieve of Eratosthenes
(define (sieve stream)
  (cons-stream
    (stream-car stream)
    (sieve (stream-filter
             (lambda (x)
               (not (divisible?
                      x (stream-car stream))))
             (stream-cdr stream)))))

(define primes (sieve (integers-starting-from 2)))

; add-streams
(define (add-streams s1 s2)
  (stream-map + s1 s2))

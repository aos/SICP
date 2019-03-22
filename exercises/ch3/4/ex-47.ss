; Exercise 3.47
; Implement semaphores
; 1. in terms of mutexes
; 2. in terms of atomic test-and-set! operations

; 1.
(define (make-semaphore n)
  (let ((lock (make-mutex))
        (acquired 0))
    (define (test-and-set!)
      (lock 'acquire)
      (if (>= acquired n)
          (begin (lock 'release) (the-sema 'acquire))
          (begin (set! acquired (+ acquired 1))
                                (lock 'release)))))
    (define (drop!)
      (lock 'acquire)
      (set! acquired (+ acquired 1))
      (lock 'release))
    (define (the-sema m)
      (cond ((eq? m 'acquire)
             (if (test-and-set!)
                 (the-sema 'acquire)))
            ((eq? m 'release) (drop!))))
    the-sema))

; 2.
(define (make-semaphore n)
  (let ((locked 0))
    (define (test-and-set!)
      (if (>= locked n)
          #t
          (begin (set! locked (+ locked 1))
                 #f)))
    (define (drop!) (set! locked (- locked 1)))
    (define (the-sema m)
      (cond ((eq? m 'acquire)
            (if (test-and-set!)
                (the-sema 'acquire))) ; retry
            ((eq? m 'release) (drop!))))
  the-sema))

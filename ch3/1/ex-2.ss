; Exercise 3.2
; 'make-monitored' takes as input a procedure 'f', that takes one input
; Returns a third procedured 'mf' that keeps track of the number of times it
; has been called by maintaining an internal counter
; - If input to 'mf' is special symbol 'how-many-calls?, 'mf' returns value of
; counter
; - If input is 'reset-count, 'mf' resets count to zero

(define (make-monitored f)
  (let ((calls 0))
    (define (reset-count)
      (begin (set! calls 0) calls))
    (lambda (m)
      (cond ((eq? m 'how-many-calls?) calls)
            ((eq? m 'reset-count) (reset-count))
            (else
              (begin (set! calls (+ calls 1))
                     (f m)))))))

(define s (make-monitored sqrt))
(s 100) ; 10
(s 'how-many-calls?) ; 1
(s 49) ; 7
(s 'how-many-calls?) ; 2
(s 'reset-count) ; 0

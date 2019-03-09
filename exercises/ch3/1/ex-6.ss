; Exercise 3.6
; New 'rand' called with either 'generate or 'reset
; (rand 'generate)
; ((rand 'reset) <new-value>)

(define (rand arg)
  (let ((x random-init))
    (define (generate)
      (begin (set! x (rand-update x)) x))
    (define (reset)
      (lambda (n) (set! x n)))
    (cond ((eq? arg 'generate) (generate))
          ((eq? arg 'reset) reset)
          (else
            (error "Unknown argument:
                   RAND" arg)))))

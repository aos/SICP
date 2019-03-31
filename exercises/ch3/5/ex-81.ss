; Exercise 3.81

(define (rand r seed)
  (define s
    (cons-stream
      seed
      (stream-map
        (lambda (request value)
          (cond ((eq? request 'generate) (rand-update value))
                ((and (pair? request) (eq? (car request) 'reset))
                 (cdr request))
                (else (error "Invalid request"))))
        r
        s)))
  s)

; Exercise 4.13
; make-unbound!

(define (make-unbound! var env)
  (define (scan vars vals)
    (cond ((null? vars)
           (make-unbound!
             var
             (enclosing-environment env))
           ((eq? var (car vars))
            (set! vars (cdr vars))
            (set! vals (cdr vals)))
           (else
             (scan (cdr vars)
                   (cdr vals))))))
  (if (eq? env the-empty-environment)
      (error "Undefined variable" var)
      (let ((frame (first-frame env)))
        (scan
          (frame-variables frame)
          (frame-values frame)))))

;; This removes the binding in the "nearest" frame that the variable was set
;; in.

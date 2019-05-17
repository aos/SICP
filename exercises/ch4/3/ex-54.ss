; Exercise 4.54
; Define require

(define (require? exp)
  (tagged-list? exp 'require))

(define (require-predicate exp)
  (cadr exp))

(define (analyze-require exp)
  (let ((pproc (analyze
                 require-predicate)))
    (lambda (env succeed fail)
      (pproc env
             (lambda (pred-value fail2)
               (if (not (true? pred-value))
                   (fail2)
                   (succeed 'ok fail2)))
             fail))))

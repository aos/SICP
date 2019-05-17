; Exercise 4.51
; permanent-set!

(define (permanent-set? exp)
  (tagged-list? exp 'permanent-set!))

(define (analyze-permanent-set exp)
  (let ((var (assignment-variable exp))
        (vproc (analyze
                 (assignment-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)
               (set-variable-value! var val env)
               (succeed 'ok fail2))
             fail))))

; If we had used just set! the value will always be 1

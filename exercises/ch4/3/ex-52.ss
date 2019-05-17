; Exercise 4.52
; if-fail

(define (if-fail? exp)
  (tagged-list? exp 'if-fail))

(define (analyze-if-fail exp)
  (let ((fproc (analyze (if-predicate exp)))
        (sproc (analyze (if-consequent exp))))
    (lambda (env succeed fail)
      (fproc env
             (lambda (first-val fail2)
               (succeed first-val fail2))
             (lambda ()
               (sproc env succeed fail))))))

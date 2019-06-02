; Exercise 4.78

(define (driver-loop)
  (define (internal-loop try-again)
    (prompt-for-input input-prompt)
    (let ((q (query-syntax-process (read))))
      ; add assertion
      (cond ((eq? q 'try-again) (try-again))
            ((assertion-to-be-added? q)
             (add-rule-or-assertion!
               (add-assertion-body q))
             (newline)
             (display
               "Assertion added to database.")
             (driver-loop))
            ; query
            (else
              (ambeval
                q
                the-global-environment
                ; success
                (lambda (value next-alternative)
                  (newline)
                  (display output-prompt)
                  (newline)
                  (display val)
                  (internal-loop next-alternative))
                ; failure
                (lambda ()
                  (display ";;; There are no more values of")
                  (display q)
                  (driver-loop)))))))
  (internal-loop
    (lambda ()
      (newline)
      (display ";;; There is no current problem"))))

(define (ambeval query env succeed fail)
  ((amb-query query) env succeed fail))

(define (amb-query query)
  (let ((all-possibilities-stream
          (stream-map
            (lambda (frame)
              (instantiate
                q
                frame
                (lambda (v f)
                  (contract-question-mark v))))
            (qeval q (singleton-stream '())))))

    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
            (fail)
            (succeed (stream-car choices)
                     (lambda ()
                       (try-next (stream-cdr choices))))))

      (try-next all-possibilities-stream))))

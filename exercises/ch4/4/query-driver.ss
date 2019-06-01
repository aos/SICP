; Driver Loop

(define input-prompt ";;; Query input:")
(define output-prompt ";;; Query results:")

(define (query-driver-loop)
  (prompt-for-input input-prompt)
  (let ((q (query-syntax-process (read))))
    ; add assertion
    (cond ((assertion-to-be-added? q)
           (add-rule-or-assertion!
             (add-assertion-body q))
           (newline)
           (display
             "Assertion added to database.")
           (query-driver-loop))
          ; query
          (else
            (newline)
            (display output-prompt)
            (display-stream
              (stream-map
                (lambda (frame)
                  ; Copy expression and replace any variables in expression by
                  ; values in given frame
                  (instantiate
                    q
                    frame
                    (lambda (v f)
                      (contract-question-mark v))))
                (qeval q (singleton-stream '()))))
            (query-driver-loop)))))

(define (instantiate
          exp frame unbound-var-handler)
  (define (copy exp)
    (cond ((var? exp)
           (let ((binding
                   (binding-in-frame
                     exp frame)))
             (if binding
                 (copy
                   (binding-value binding))
                 (unbound-var-handler
                   exp frame))))
          ((pair? exp)
           (cons (copy (car exp))
                 (copy (cdr exp))))
          (else exp)))
  (copy exp))

;; Compound queries

; and
(define (conjoin conjuncts frame-stream)
  (if (empty-conjunction? conjuncts)
      frame-stream
      (conjoin (rest-conjuncts conjuncts)
               (qeval
                 (first-conjunct conjuncts)
                 frame-stream))))

; (put 'and 'qeval conjoin)

; or
(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
      the-empty-stream
      (interleave-delayed
        (qeval (first-disjunct disjuncts)
               frame-stream)
        (delay (disjoin
                 (rest-disjuncts disjuncts)
                 frame-stream)))))

; (put 'or 'qeval disjoin)

; not
(define (negate operands frame-stream)
  (stream-flatmap
    (lambda (frame)
      (if (stream-null?
            (qeval (negated-query operands)
                   (singleton-stream frame)))
          (singleton-stream frame)
          the-empty-stream))
    frame-stream))

; (put 'not 'qeval negate)

; lisp-value
(define (lisp-value call frame-stream)
  (stream-flatmap
    (lambda (frame)
      (if (execute
            (instantiate
              call
              frame
              (lambda (v f)
                (error "Unknown pat var: LISP-VALUE" v))))
          (singleton-stream frame)
          the-empty-stream))
    frame-stream))

; (put 'lisp-value 'qeval lisp-value)

(define (execute exp)
  (apply (eval (predicate exp)
               user-initial-environment)
         (args exp)))

(define (always-true ignore frame-stream)
  frame-stream)

; (put 'always-true 'qeval always-true)

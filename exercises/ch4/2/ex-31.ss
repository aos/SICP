; Exercise 4.31
; Upward-compatible extension for lazy evaluation

;; (define (f a (b lazy) c (d lazy-memo))
;;   ...)

; 'a' and 'c' will be evaluated on procedure call
; 'b' will be delayed
; 'd' will be delayed and memoized

; 1. New syntax for 'define' -> lambda parameters
; 2. Handle arguments using eval or apply

(define (param-type param)
  (if (pair? param)
      (cond ((eq? (cadr param) 'lazy)
             'lazy)
            ((eq? (cadr param) 'lazy-memo)
             'memo)
            (else
              (error "Unsupported declaration
                     LAMBDA-PARAM-TYPE" param)))
      'none))

(define (list-of-mixed-args exps proc-params env)
  (if (no-operands? exps)
      '()
      (let ((type (param-type (car proc-params))))
        (cons (cond ((eq? type 'lazy)
                     (delay-it (first-operand exps) env))
                    ((eq? type 'memo)
                     (delay-it-memo (first-operand exps) env))
                    (else
                     (actual-value (first-operand exps) env)))
              (list-of-mixed-args
                (rest-operands exps)
                (cdr proc-params)
                env)))))

(define (force-it obj)
  (cond ((thunk-memo? obj)
         (let ((result
                 (actual-value
                   (thunk-exp obj)
                   (thunk-env obj))))
           (set-car! obj 'evaluated-thunk)
           ;; replace exp with its value
           (set-car! (cdr obj) result)
           ;; forget un-needed env
           (set-cdr! (cdr obj) '())
           result))
        ((thunk? obj)
         (actual-value (thunk-exp obj)
                       (thunk-env obj)))
        ((evaluated-thunk? obj)
         (thunk-value obj))
        (else obj)))

(define (thunk-memo? obj) (tagged-list? obj 'thunk-memo))
(define (delay-it-memo exp env)
  (list 'thunk-memo exp env))

(define (apply procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure
           procedure
           (list-of-arg-values
             arguments
             env)))
        ((compound-procedure? procedure)
         (eval-sequence
           (procedure-body procedure)
           (extend-environment
             (strip-param-types procedure)
             (list-of-mixed-args
               arguments
               (procedure-parameters procedure)
               env)
             (procedure-environment procedure))))
        (else (error "Unknown procedure
                      type: APPLY"
                      procedure))))

(define (strip-param-types procedure)
  (map (lambda (param)
         (if (pair? param)
             (car param)
             param))
       (procedure-parameters procedure)))

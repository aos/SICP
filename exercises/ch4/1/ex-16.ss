; Exercise 4.16
; 'let' transformation

; Turn this:
(lambda (<vars>)
  (define u (<e1>))
  (define v (<e2>))
  <e3>)

; Into this:
(lambda (<vars>)
  (let ((u '*unassigned*)
        (v '*unassigned*))
    (set! u <e1>)
    (set! v <e2>)
    <e3>))

; 1.
(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop
               (enclosing-environment env)))
            ((eq? var (car vars))
             (car vals))
            ((eq? var '*unassigned*)
             (error "Unassigned variable" var))
            (else (scan (cdr vars)
                        (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

; 2.
(define (scan-out-defines proc-body)
  (define (make-let def-list body)
    (list
      'let
      (map (lambda (d)
             (list (car d) '*unassigned*))
           def-list)
      (sequence->exp
        (append (map (lambda (d)
                       (list 'set! (car d) (cadr d)))
                     def-list)
                body))))
  (make-let
    (map (lambda (s)
           (list (cadr s) (caddr s)))
         (filter
           (lambda (seq)
             (eq? (car seq) 'define))
           proc-body))
    (filter (lambda (seq)
              (not (eq? (car seq) 'define)))
            proc-body)))

; 3. Install it in 'make-procedure' as that way we can clear out the body
; before calling it in 'procedure-body'

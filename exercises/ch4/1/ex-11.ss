; Exercise 4.11
; The current implementation of frames is representated as a pair of lists
; Rewrite the frame representation as a list of bindings, where each binding
; is a name-value pair

(define (assoc key records)
  (cond ((null? records) #f)
        ((equal? key (caar records))
         (car records))
        (else (assoc key (cdr records)))))

; A frame is an associative list
(define (make-frame) (list '*frame*))
(define (add-binding-to-frame! var val frame)
  (set-cdr! frame
            (cons (cons var val)
                  (cdr frame))))

;; Variable operations
(define (lookup-variable-value var env)
  (define (env-loop env)
    (cond ((eq? env the-empty-environment)
           (error "Unbound variable" var)
          ((assoc var
                  (cdr (first-frame env))) => cdr)
          (else
            (env-loop
              (enclosing-environment env))))))
  (env-loop env))

(define (set-variable-value! var val env)
  (define (env-loop env)
    (cond ((eq? env the-empty-environment)
           (error "Unbound variable: SET!" var))
          ((assoc var
                  (cdr (first-frame env)))
           (set-cdr! (assoc var (cdr (first-frame env)))
                     val))
          (else
            (env-loop
              (enclosing-environment env)))))
  (env-loop env))

(define (define-variable! var val env)
  (let* ((frame (first-frame env))
         (record (assoc var (cdr frame))))
    (if record
        (set-cdr! record val)
        (set-cdr! frame
                  (cons (cons var val)
                        (cdr frame))))))

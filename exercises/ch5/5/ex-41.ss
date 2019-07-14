; Exercise 5.41
; find-variable

; Given this compile-time environment:
(define env '((y z) (a b c d e) (x y)))

(find-variable 'c env) ; (1 . 2)
(find-variable 'x env) ; (2 . 0)
(find-variable 'w env) ; 'not-found

; A variation on lookup-variable-value
(define (find-variable var compile-env)
  (define (env-loop env f-num)
    (define (scan vars offset)
      (cond ((null? vars)
             (env-loop (cdr env)
                       (+ 1 f-num)))
            ((eq? var (car vars))
             (cons f-num offset))
            (else (scan (cdr vars)
                        (+ 1 offset)))))
    (if (null? env)
        'not-found
        (scan (car env) 0)))
  (env-loop compile-env 0))

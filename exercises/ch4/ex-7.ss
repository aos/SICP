; Exercise 4.7
; Define 'let*'
; Variables are bound sequentially and each binding is made available in which
; all of the proceding bindings are visible

(let* ((x 3)
       (y (+ x 2))
       (z (+ x y 5)))
  (* x z)) ; 39

; As nested lets:
(let ((x 3))
  (let ((y (+ x 2)))
    (let ((z (+ x y 5)))
      (* x z))))

(define (let*? exp)
  (tagged-list? exp 'let*))
(define (let*-vars exp) (cadr exp))
(define (let*-body exp) (caddr exp))
(define (let*->nested-lets exp)
  (define (iter exps body)
    (if (null? exps)
        body
        (list 'let
              (list (car exps))
              (iter (cdr exps) body))))
  (iter (let*-vars exp)
        (let*-body exp)))

;; Can we just add this directly to 'eval'?
; Most likely not. We must add one more call to translate the generated 'let's
; to lambda functions (which was done in the previous exercise) before we can
; evaluate.

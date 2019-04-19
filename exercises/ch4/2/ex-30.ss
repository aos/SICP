; Exercise 4.30

; 1. Ben is right because 'for-each' starts with 'begin' which ultimately
; transforms everything after through 'eval-sequence'. 'Eval-sequence'
; subsequently evaluates each item, and since the first eval is an application,
; it will evaluate using 'actual-value' with 'car' and since 'car' is a
; primitive, it will evaluate that as well, resulting in our for-each look
; calling the lambda on each list item.

; 2.
(define (p1 x)
  (set! x (cons x '(2))) x)

(define (p2 x)
  (define (p e) e x)
  (p (set! x (cons x '(2)))))

; Original eval
(p1 1) ; (1 2)
(p2 1) ; 1 -> because (set! x (cons x '(2))) will be delayed in function (p),
; we return 1.

; Cy's method
(define (eval-sequence exps env)
  (cond ((last-exp? exps)
         (eval (first-exp exps) env))
        (else
          (actual-value (first-exp exps)
                        env)
          (eval-sequence (rest-exps exps)
                         env))))

(p1 1) ; (1 2)
(p2 1) ; (1 2) -> forces thunk (set! x (cons x '(2))) to evaluate

; 3. When using actual-value, we call (force-it p), if p is a normal value,
; force-it will return p anyway

; 4. I prefer the original style

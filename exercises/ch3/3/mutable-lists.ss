; Mutable lists

(define x '((a b) c d))
(define y '(e f))

(set-car! x y)

(define z (cons y (cdr x)))

(set-cdr! x y)

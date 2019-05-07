; Exercise 4.6
; Implement 'let' as 'lambda'

; (let ((<var1> <exp1>)
;       (<var2> <exp2>))
;   <body>)

(define (let? exp)
  (tagged-list? exp 'let))

(define (let-vars exp) (map car (cadr exp)))
(define (let-inits exp) (map cadr (cadr exp)))
(define (let-body exp) (cddr exp))
(define (let->combination exp)
  (cons (make-lambda
          (let-vars exp)
          (let-body exp))
        (let-inits exp)))

; Example
(let ((x 3)
      (y (+ 3 4)))
  (* x y))

; Turns into it...
((lambda (x y) (* x y)) 3 (+ 3 4))

; Exercise 4.8
; Named 'let'
; (let <var> <bindings> <body>)

(define (let-vars exp) (map car (cadr exp)))
(define (let-inits exp) (map cadr (cadr exp)))
(define (let-body exp) (cddr exp))
(define (let->combination exp)
  (if (named-let? exp)
      ; In order not to pollute the namespace:
      ; We create a lambda with no args where we define our function
      ; And execute it, then call the lambda
      (cons (make-lambda
              '()
              (list (list 'define
                          (let-named exp)
                          (make-lambda (let-named-vars exp)
                                       (list (let-named-body exp))))
                    (cons (let-named exp) (let-named-inits exp))))
            '())
      (cons (make-lambda
              (let-vars exp)
              (let-body exp))
            (let-inits exp)))))

(define (let-named exp) (cadr exp))
(define (let-named-vars exp) (map car (caddr exp)))
(define (let-named-inits exp) (map cadr (caddr exp)))
(define (let-named-body exp) (cadddr exp))
(define (named-let? exp)
  (symbol? (let-named exp)))

; Example
(let fib-iter ((a 1) (b 0) (count n))
  (if (= count 0)
      b
      (fib-iter (+ a b) 
                a 
                (- count 1))))

;; Becomes
((lambda ()
   (define (fib-iter a b count)
     (if (= count 0)
         b
         (fib-iter (+ a b)
                   a
                   (- count 1))))
   (fib-iter 1 0 n)))

; Exercise 4.33

(define prev-eval eval)

(define (eval exp env)
  (if (quoted? exp)
      (text-of-quotation exp env)
      (prev-eval exp env)))

(define (make-quoted-list lst)
  (if (null? lst)
      (list 'quote '())
      (list 'cons
            (list 'quote (car lst))
            (make-quoted-list (cdr lst)))))

(define (text-of-quotation exp env)
  (if (pair? (cadr exp))
      (eval (make-quoted-list (cadr exp)) env)
      (cadr exp)))

;; Inside evaluator
(define (cons x y) (lambda (m) (m x y)))
(define (car z) (z (lambda (p q) p)))
(define (cdr z) (z (lambda (p q) q)))

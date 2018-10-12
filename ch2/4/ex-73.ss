; Exercise 2.73
; Refactor 'deriv' to use a type-tag system

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var)
             1
             0))
        (else ((get 'deriv (operator exp))
               (operands exp)
               var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

; 1 - 
; a. We factored out the checking for type (in this case + or *) and placed in
; its stead the (get <op> <type>) procedure which will pull the correct
; operation procedure to be used.
; b. We can't assimilate number? or variable? because they are very simple
; predicates which do not require different representations based on type

(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product m1 m2) (list '* m1 m2))

; 2. Procedure for derivates of sums and products, and aux code required to
; install them in the table
(define (install-deriv-package)
  (put 'deriv '+
       (lambda (exp var)
  (put 'deriv '*
       (lambda (exp var)
         (make-sum
           (make-product ((get 'operand-one '*) exp)
                         (deriv ((get 'operand-two '*) exp) var))
           (make-product (deriv ((get 'operand-one '*) exp) var)
                         ((get 'operand-one '*) exp)))))
  'done)

(define (install-deriv-package)
  ;; internal procedures
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  (define (make-sum a1 a2) (list '+ a1 a2))
  ;; interface to rest of system
  (put 'deriv '+
       (lambda (operands var)
         (make-sum
           (deriv (addend operands) var)
           (deriv (augend operands) var))))

  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))
  (define (make-product m1 m2) (list '* m1 m2))

  (put 'deriv '*
       (lambda (operands var)
         (make-sum
           (make-product
             (multiplier operands)
             (deriv (multiplicand operands) var))
           (make-product
             (deriv (multiplier operands) var)
             (multiplicand operands)))))
  'done)

(define (install-deriv-exp-package)
  ;; internals
  (define (base n) (car n))
  (define (exponent n) (cadr n))
  (define (make-exp b e) (list '** b e))
  ;; interface
  (put 'deriv '**
       (lambda (operands var)
         (make-product
           (exponent operands)
           (make-product (make-exp (base operands)
                                   (- (exponent operands) 1))
                         (deriv (base operands) var)))))
  'done)

; 4. Index procedures in the opposite way, so that the dispatch looks like:
((get (operator exp) 'deriv)
 (operands exp) var)

; What corresponding changes must be made?
; We would only need to swap how we order the data in the table such that the
; type comes first and the operation comes second

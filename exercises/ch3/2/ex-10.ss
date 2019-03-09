; Exercise 3.10
; Show that 'let' and 'lambda' create objects with the same behavior

; Using 'let'
(define (make-withdraw init-amount)
  (let ((balance init-amount))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance
                       (- balance amount))
                 balance)
          "Insufficient funds"))))

; Using 'lambda'
(define (make-withdraw-lambda init-amount)
  ((lambda (balance)
     (lambda (amount)
       (if (>= balance amount)
           (begin (set! balance
                    (- balance amount))
                  balance)
           "Insufficient funds")))
   init-amount))

(define W1 (make-withdraw 100))
(W1 70) ; 30

(define W2 (make-withdraw-lambda 100))
(W2 70) ; 30

; set! will affect only 'balance'. 'initial-amount' remains unchanged as this
; is the first frame is created.

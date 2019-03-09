; State variables

; Global state
(define balance 100)

(define (withdraw amount)
  (if (>= balance amount)
      ; 'set!' changes value of the variable given
      ; 'begin' evaluates expressions in order:
      ; (begin <exp 1> <exp 2> ... <exp k>), the value of <exp k> is returned
      ; as the value of the entire 'begin' form
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))

; Local state
(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance
                   (- balance amount))
                 balance)
          "Insufficient funds"))))

; Using formal parameters to establish local environment
(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds")))

(define W1 (make-withdraw 500))

; Bank-account object
(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request:
                       MAKE-ACCOUNT" m))))
  dispatch)

(define acc (make-account 100))
((acc 'withdraw) 50) ; 50
((acc 'withdraw) 60) ; "Insufficient funds"
((acc 'deposit) 40) ; 90

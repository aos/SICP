; Exercise 4
; Modify 'make-account' so that if an account is accessed more than seven
; consecutive times with an incorrect password, it invokes the procedure
; 'call-the-cops'

(define (make-account balance password)
  (let ((incorrect-count 0))
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance
                   (- balance amount))
                 balance)
          "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (call-the-cops)
      "The cops have been notified!")
    (define (dispatch p m)
      (if (eq? password p)
          (cond ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                (else (error "Unknown request:
                             MAKE-ACCOUNT"
                             m)))
          (lambda (n)
            (begin (set! incorrect-count (+ incorrect-count 1))
                   (if (>= incorrect-count 7)
                       (call-the-cops)
                       "Incorrect password")))))
    dispatch))

(define acc
  (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40) ; 60
((acc 'some-other-password 'deposit) 50) ; "Incorrect password"
((acc 'secret-password 'deposit) 30)

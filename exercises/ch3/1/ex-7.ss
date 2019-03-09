; Exercise 3.7
; 'make-joint' takes three arguments:
; 1. password-protected account, 2. password, 3. new password

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance
                     (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (joint new-pw)
    (dispatch new-pw))
  (define (dispatch pw)
    (lambda (inp-pw m) 
      (if (eq? pw inp-pw)
          (cond ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                ((eq? m 'joint) joint)
                (else (error "Unknown request: MAKE-ACCOUNT"
                             m)))
          (lambda (_) "Incorrect password"))))
  (dispatch password))

(define (make-joint acc current-pw new-pw)
  ((acc current-pw 'joint) new-pw))

(define peter-acc
  (make-account 100 'open-sesame))

((peter-acc 'open-sesame 'withdraw) 30)

(define paul-acc
  (make-joint peter-acc
              'open-sesame
              'rosebud))

((paul-acc 'rosebud 'withdraw) 100)
((paul-acc 'rosebud 'deposit) 40)

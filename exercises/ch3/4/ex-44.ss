; Exercise 3.44
; What if we define a new method that allows transfer, using each account's
; method:

(define (transfer from-account to-account amount)
  ((from-account 'withdraw) amount)
  ((to-account 'deposit) amount))

; In this case, this definition is fine for allowing transfers. The reason
; being, is that the old 'exchange' procedure did a retrieval of account
; balance (and calculated the difference). This was unserialized access and can
; be incorrect when doing withdrawals or deposits.

; Exercise 3.48

; Note: This requires that each (make-account) also opens up a 'get-id'
; procedure which gives the ID of the account
(define (serialized-exchange account1 account2)
  (let ((serializer1 'serializer-for-bigger-id-acc)
        (serializer2 'serializer-for-smaller-id-acc)
        (cond ((> (get-id account1) (get-id account2))
               (set! serializer1 (account1 'serializer))
               (set! serializer2 (account2 'serializer)))
              (else (set! serializer1 (account2 'serializer))
                    (set! serializer2 (account1 'serializer)))))
    ((serializer1 (serializer2 exchange))
     account1
     account2)))

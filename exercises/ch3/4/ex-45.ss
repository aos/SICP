; Exercise 3.45
; Should we make accounts and serializers at the same time and export the
; serializer in addition to using it to serialize accounts?

; This is wrong because 'serialized-exchange' will wrap the exchanges in both
; serializers again. This will not work since the two procedures can only run
; concurrently if and only if they have not been serialized by the same
; serializer. In this case, they will try to acquire the lock again and fail
; because it has been acquired by the same procedure!

; Exercise 3.43

; Double serializing the exchange procedure, using both accounts' serializers
; protects the exchange operations from being interleaved with the other
; account operations from either account. This makes the exchanges atomic.

; In the previous case, the exchange is not atomic when including more than two
; accounts. As the serialization schemes will not depend on each other and can
; be interleaved.

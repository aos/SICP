; Exercise 3.42
; Is it safe to define the account and allow calls to protected to happen
; outside of the dispatch procedure?

; I think the change is fine. Without knowing the internal implementation of
; (make-serializer), we have no extra knowledge to believe that they will not
; be working the same. However, We will be calling the same serialized
; procedures rather than creating new ones.

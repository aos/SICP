; Exercise 2.55
; Why does

(car ''abracadabra) ; print back 'quote'?

; The first quote will signal to the interpreter to interpret everything after
; literally (as symbols). And since ' is just sugar for 'quote', it will remap
; it to mean that. The interpreter will translate the statement above as:
; (quote (quote abra)). The first quote will quote the next entity, which is
; (quote abra) -> which is just interpretted literally.

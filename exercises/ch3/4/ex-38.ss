; Exercise 3.38
; Peter -> deposit  $10
; Paul  -> withdraw $20
; Mary ->  withdraw half

; 1. Peter ($110) -> Paul ($90) -> Mary ($45)
; 2. Peter ($110) -> Mary ($55) -> Paul ($35)
; 3. Paul ($90) -> Peter ($100) -> Mary ($50)
; 4. Paul ($90) -> Mary ($45) -> Peter ($55)
; 5. Mary ($50) -> Peter ($60) -> Paul ($40)
; 6. Mary ($50) -> Paul ($30) -> Peter ($40)

; Another one, using first as example:
; Peter (set! balance $110), Paul (new-value $90) --> if Peter goes last,
; balance is $110 even though Paul withdrew $10.

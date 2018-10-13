; Exercise 2.76
; Describe the changes that must be made to a system in order to
; add new types or new operations
; 1. generic operations w/ explicit dispatch
; 2. data-directed style
; 3. message-passing
; Which is most appropriate for a system with frequent type additions?
; Which for frequent operation additons? 

; 1. For new types and new operations, you essentially have to create a bunch of
; new procedures, each with their own type reference in the procedure name
; 2. You have to install a new package for each type and operation
; 3. Message passing de-couples types and operations

; For a system with frequent type additions, the most appropriate style would be
; the data-directed style

; For a system with frequent operations additions -- the most appropriate would
; be the message passing style

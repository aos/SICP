; Exercise 4.17

; 1. Why is there an extra frame?
; => Because let expressions will be substituted to be lambda expressions, every
; new lambda expression extends the environment

; 2. Why won't this make a difference?
; => Because this environment will be the new environment in which everything will
; be evaluated anyway.

; 3. How to make interpreter implement simultaneous scope for internal
; definitions without constructing an extra frame?
; => Move all the 'defines' to the top of the procedure body.

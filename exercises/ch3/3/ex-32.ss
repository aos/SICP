; Exercise 3.32
; Procedures for each time segment are kept in a queue
; Explain behavior of an 'and-gate'

; For an 'and-gate', we are adding both wires into the same time segment and
; changing their state. Since a1 goes first, it will set its input as 1, and
; with a2's input as 1, we get an output of 1. Then when a2 gets called, it
; sets its input as 0, and with a1's input as 1, we get a final (correct)
; output as 0.

; However, if we alter this behavior and allow a2 to go first, we have already
; captured the state for each item, if we change the order, we get a final
; output of 1, which is incorrect.

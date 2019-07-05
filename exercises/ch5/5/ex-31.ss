; Exercise 5.31
; Superfluous save and restore ops eliminated by preserving

; 1.
(f 'x 'y)
; All of the register save and restores are superfluous.

; 2.
((f) 'x 'y)
; All of the register save and restores are superfluous.
; The reason for this is that while we are evaluating 'f',
; it doesn't have any operands

; 3.
(f (g 'x) y)
; All registers will be needed. Proc and argl are used for saving 'f and 'g,
; same to save 'x. env is needed because when we get to y, we have to look up
; its environment.

; 4.
(f (g 'x) 'y)
; All registers are needed (perhaps maybe not env) since 'y is just a symbol.

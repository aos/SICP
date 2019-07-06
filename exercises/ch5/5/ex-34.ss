; Exercise 5.34
; Compiled iterative factorial
; Refer to fact-iter-compiled.ss for generated code

; The difference being in (* n (factorial (- n 1))), we save the continue
; register, before diving into the next factorial function (line 76). Whereas
; in the iterative factorial, we do a straight (goto ...) (line 104).

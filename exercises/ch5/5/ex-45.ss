; Exercise 5.45
; Comparing factorials

; 1.
; Compiled
; --------
; max-depth     = 3n - 1
; total-pushes  = 6n + 1

; Interpreted
; -----------
; max-depth     = 3n + 5
; total-pushes  = 32n - 16

; Special
; -------
; max-depth     = 2n - 2
; total-pushes  = 2n - 2

;; Ratios
; Compiled:Interpreted
; pushes = 0.191
; depth = 0.965

; Special:Interpreted
; pushes = 0.063
; depth = 0.062

; 2. compile-proc-appl declares all registers as modified even if the
; actual procedure does not modify any. This causes a lot of unnecessary saves
; and restores.

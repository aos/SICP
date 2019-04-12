; Exerce 4.14
; Why does adding the system version of map as a primitive break the evaluator?

; The only reason I can think of this is happening is because the system
; version of map is a variadic function. When we evaluate the rest of the
; function, it breaks it down to its primitives and assumes that these are all
; lists and tries to apply all of them.

; Exercise 4.64

; Original rule
(rule (outranked-by ?staff-person ?boss)
      (or (supervisor ?staff-person ?boss)
          (and (supervisor ?staff-person 
                           ?middle-manager)
               (outranked-by ?middle-manager 
                             ?boss))))

; Modified
(rule (outranked-by ?staff-person ?boss)
      (or (supervisor ?staff-person ?boss)
          (and (outranked-by ?middle-manager
                             ?boss)
               (supervisor ?staff-person 
                           ?middle-manager))))

; It goes into an infinite loop because it will attempt to pattern match on
; (outranked-by ?middle-manager ?boss), of which loops to then again go back to
; (outranked-by ?middle-manager ?boss)

; The original rule does not have this issue because the OR will fail on either
; the first or second assumption.

; Exercise 4.65

(rule (wheel ?person)
      (and (supervisor ?middle-manager 
                       ?person)
           (supervisor ?x ?middle-manager)))

;; Because there are four middle-managers whose manager is Oliver Warbucks.
;; Each path is taken and is reported as a separate case.

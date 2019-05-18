; Exercise 4.58

(rule (bigshot ?person ?division)
      (and (job ?person (?division . ?type))
           (or (not (supervisor ?person ?boss))
               (and (supervisor ?person ?boss)
                    (not (job ?boss (?division . ?x))))))))

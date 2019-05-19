; Exercise 4.63

; 1.
(rule (grandson ?g ?s)
      (and (son ?g ?f)
           (son ?f ?s)))

; 2.
(rule (son-of ?m ?s)
      (or (son ?m ?s)
          (and (wife ?m ?w)
               (son ?w ?s))))

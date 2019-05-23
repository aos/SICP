; Exercise 4.69

(rule (ends-in-grandson? (?before grandson)))
(rule (ends-in-grandson? (?first . ?relationship))
      (ends-in-grandson? ?relationship))

(rule ((great . ?rel) ?x ?y)
      (and (ends-in-grandson? ?rel)
           (son ?x ?z)
           (?rel ?z ?y)))

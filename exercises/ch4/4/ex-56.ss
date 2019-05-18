; Exercise 4.56

; 1.
(and
  (supervisor ?person (Ben Bitdiddle))
  (address ?person . ?where))

; 2.
(and
  (salary (Ben Bitdiddle) ?ben)
  (salary ?person ?amount)
  (lisp-value < ?amount ?ben))

; 3.
(and
  (not (job ?boss (computer . ?type)))
  (supervisor ?underling ?boss)
  (job ?boss ?job))

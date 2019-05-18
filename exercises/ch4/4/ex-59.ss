; Exercise 4.59

; 1.
(meeting ?division (Friday . ?time))

; 2.
(rule (meeting-time ?person ?day-and-time)
      (and (meeting whole-company ?day-and-time)
           (job ?person (?division . ?r))
           (meeting ?division ?day-and-time)))

; 3.
(meeting-time (Hacker Alyssa P) (Wednesday . ?time))

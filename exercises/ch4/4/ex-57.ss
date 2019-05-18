; Exercise 4.57

(rule (replaced-by ?person-1 ?person-2)
      (and (job ?person-1 ?type-p1)
           (job ?person-2 ?type-p2)
           (or (same ?type-p1 ?type-p2)
               (can-do-job ?type-p1 ?type-2))
           (not (same ?person-1 ?person-2))))

; 1.
(replaced-by ?person-1 (Fect Cy D))

; 2.
(and (salary ?person-1 ?amount-1)
     (salary ?person-2 ?amount-2)
     (replaced-by ?person-1 ?person-2)
     (lisp-value > ?amount-2 ?amount-1))

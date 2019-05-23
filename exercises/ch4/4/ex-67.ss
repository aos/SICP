; Exercise 4.67

; Evaluation process:
; 1. Attempt to pattern match directly on the database
; 2. Unify query pattern with the conclusion of each rule
;    a. Create a frame with bindings matching rule
;    b. Evaluate the compound query that is the body of the rule

(married Mickey ?who)
; -> unify and create frame:
; ?x = Mickey, ?who = ?y
; Apply rule body:
(married ?who Mickey)
; Result through pattern matching =>
(married Minnie Mickey)
; Unify again...
; ?x = ?who, ?y = Mickey
(married Mickey ?who)

; One technique is to put a detector for special kinds of loops, in the case of
; the simple (married Mickey ?who) rule, we can see if the rule body swaps the
; order of variables. If that is the case, we can assume that the query
; relationship goes both ways. As soon as we find one answer, we return the
; result and complete.

; Another technique would be to keep track of variables that go unbound in
; previous applications/unifications. If they remain unbound, we will most
; likely never find a solution.

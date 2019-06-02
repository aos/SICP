; Exercise 4.77

; What we could do is to check to see if the query that
; we received is a (not) or (lisp-value) query. If so, we delay them
; and continue on with our querying. The only problem I see here is how
; long do we have to wait? What is the consensus on "enough" frames being
; generated?

; What we could do is if a query that is not (non) or (lisp-value) successfully
; resolves, we look through our delayed nots/lisp-values and see if we can
; apply any of those clauses.

; Exercise 3.31
; 'accept-action-procedure!'
; when a new action procedure is added to a wire, the proc is run. Why?

; This initialization is necessary because each gate when defined and ran,
; actually makes a call to 'after-delay' which adds the specific action to the
; agenda. Then, when calling 'propgate' --> we run through the agenda, item by
; item.

; If we had defined it like so:
(define (accept-action-procedure! proc)
  (set! action-procedures
        (cons proc action-procedures)))

; We would never add the action to the agenda and it would not work

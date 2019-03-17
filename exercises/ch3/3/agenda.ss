; The agenda
; Data structure which contains a schedule of the things to do

(define (after-delay delay action)
  (add-to-agenda!
    (+ delay (current-time the-agenda))
    action
    the-agenda))

(define (propogate)
  (if (empty-agenda? the-agenda)
      'done
      (let ((first-item
              (first-agenda-item the-agenda)))
        (first-item)
        (remove-first-agenda-item! the-agenda)
        (propogate))))

(define (probe name wire)
  (add-action!
    wire
    (lambda ()
      (newline)
      (display name)
      (display " ")
      (display (current-time the-agenda))
      (display "  New-value = ")
      (display (get-signal wire)))))

(define the-agenda (make-agenda))
(define inverter-delay 2)
(define and-gate-delay 3)
(define or-gate-delay 5)

(define input-1 (make-wire))
(define input-2 (make-wire))
(define sum (make-wire))
(define carry (make-wire))

(probe 'sum sum) ; sum 0  New-value = 0
(probe 'carry carry) ; carry 0  New-value = 0

(half-adder input-1 input-2 sum carry) ; ok

(set-signal! input-1 1) ; done
(propagate) ; sum 8   New-value = 1

(set-signal! input-2 1) ; done
(propagate)
; carry 11  New-value = 1
; sum 16    New-value = 0

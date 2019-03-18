; Exercise 3.34
; Why is this defintion of squarer wrong?

; Test prog
(define (tester a b) (adder a a b))

(define test-a (make-connector))
(define test-b (make-connector))

(tester test-a test-b)
(probe "Test-A" test-a)
(probe "Test-B" test-b)
(set-value! test-a 3 'user)
(forget-value! test-a 'user)
(set-value! test-b 5 'user)

; Essentially what's happening, is that since we are using the same connector
; twice, we are re-writing state for this connector on all calls. So while this
; works for 'set-value!' once, once we attempt to 'forget-value!', we are
; calling 'forget-value!' on the same item more than once, which does nothing.

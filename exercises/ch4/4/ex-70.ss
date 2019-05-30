; Exercise 4.70
; What's wrong with this?

(define (add-assertion! assertion)
  (store-assertion-in-index assertion)
  (set! THE-ASSERTIONS
        (cons-stream assertion
                     THE-ASSERTIONS))
  'ok)

; This causes an infinite loop because we set THE-ASSERTIONS to point to
; itself.

; Exercise 3.30
; Write a 'ripple-carry-adder' procedure

(define (full-adder a b c-in sum c-out)
  (let ((c1 (make-wire))
        (c2 (make-wire))
        (s (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))

(define (ripple-carry-adder a-list b-list s-list c-in)
  (if (null? a-list)
      'ok
      (let ((c-out (make-wire))
            (fa (full-adder (car a-list)
                            (car b-list)
                            c-in
                            (car s-list)
                            c-out)))
        (if (null? (cdr a-list))
            (set-signal! c-out 0)
            (ripple-carry-adder (cdr a-list)
                                (cdr b-list)
                                (cdr s-list)
                                c-out)))))

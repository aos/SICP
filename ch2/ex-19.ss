; Exercise 2.19
; Change the 'cc' procedure so that its second argument is a list of the values
; of the coins to use rather than an integer specifying which coins to use.

(define us-coins
  (list 25 50 10 5 1))

(define uk-coins
  (list 100 50 20 10 5 2 1 0.5))

(define (first-denomination items) (car items))
(define (except-first-denomination items) (cdr items))
(define (no-more? items) (null? items))

(define (cc amount coin-values)
  (cond ((= amount 0)
         1)
        ((or (< amount 0) (no-more? coin-values))
         0)
        (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount (first-denomination coin-values))
                 coin-values)))))

; Then calling 'cc' as follows:
(cc 100 us-coins) ; 292

; The order of the list 'coin-values' does not affect the answer produced
; because each coin value from the list has its own node expansion.

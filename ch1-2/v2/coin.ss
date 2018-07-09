; Counting change
; ==
; How many different ways can we make change of $1.00, given half-dollars,
; quarters, dimes, nickels, and pennies?

; The number of ways to change amount 'a' using 'n' kinds of coins equals:
; - # of ways to change amount 'a' using all but first kind of coin
; PLUS
; - # of ways to change amount 'a - d' using all 'n' kinds of coins
;   - where 'd' is the denomination of the first kind of coin
;
; Ex: 10 cents using nickels and pennies (n = 2, a = 10)
; Case 1:
; 10 - 1 -> x10 (a == 0, count += 1)
; Case 2:
; 10 - 5 = 5

; (Case 1 descent:)
; 5 - 5 = 0 (a == 0, count += 1)
; 5 - 1 -> x5 (a == 0, count += 1)

; Top-level definition
(define (count-change amount)
  (cc amount 5))
; Recursive method
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
; Grabs the first denomination and works its way down the list
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

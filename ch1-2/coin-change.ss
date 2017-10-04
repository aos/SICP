; Coin change algorithm recursively
; Number of ways to change amount `a` using `n` kinds of coins equals:
; 1. The # of ways to change amount `a` using all BUT first kind of coin
; AND
; 2. # of ways to change amount `a` - `d` using all `n` kinds of coins,
; where `d` is denomination of first coin

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds of coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

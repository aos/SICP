; Exercise 5.33
; Difference between compiled versions of factorial

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(define (fact-alt n)
  (if (= n 1)
      1
      (* (fact-alt (- n 1)) n)))

;; The only difference is if we evaluate fact-alt before retrieving 'n' we have
;; to save 'env' and restore it. However, for evaluating n first, we have to
;; save argl and retrieve it later. Ultimately I don't think it makes a
;; difference.

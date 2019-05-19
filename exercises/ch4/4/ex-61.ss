; Exercise 4.61

(rule (?x next-to ?y in (?x ?y . ?u)))
(rule (?x next-to ?y in (?v . ?z))
      (?x next-to ?y in ?z))

;; Queries:

; 1.
(?x next-to ?y in (1 (2 3) 4))
(1 next-to (2 3) in (1 (2 3) 4))


; 2.
(?x next-to 1 in (2 1 3 1))
(2 next-to 1 in (2 1 3 1))
(3 next-to 1 in (2 1 3 1))

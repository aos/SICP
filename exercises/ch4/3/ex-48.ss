; Exercise 4.48
; Implement adjectives

(define adjectives
  '(adjective happy cool giant good shiny small))

(define (parse-simple-noun-phrase)
  (amb (list 'simple-noun-phrase
             (parse-word articles)
             (parse-word adjectives)
             (parse-word nouns))
       (list 'simple-noun-phrase
             (parse-word articles)
             (parse-word nouns))))

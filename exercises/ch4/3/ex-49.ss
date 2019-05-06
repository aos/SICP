; Exercise 4.49

(define (parse-word word-list)
  (require (not (null? *unparsed*)))
  (require (not (null? (cdr word-list))))
  (let ((found-word (amb (cdr word-list))))
    (list (car word-list) found-word)))

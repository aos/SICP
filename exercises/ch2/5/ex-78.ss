; Exercise 2.78
; Modify 'type-tag', 'contents', and 'attach-tag' so that our generic system
; takes advantage of Scheme's internal type system

(define (attach-tag type-tag contents)
  (if (eq? type-tag 'scheme-number)
      contents
      (cons type-tag contents)))

(define (type-tag datum)
  (cond ((number? datum) 'scheme-number)
        ((pair? datum) (car datum))
        (error "Bad tagged datum:
               TYPE-TAG" datum)))

(define (contents datum)
  (cond ((number? datum) datum)
        ((pair? datum) (cdr datum))
        (error "Bad tagged datum:
               CONTENTS" datum)))

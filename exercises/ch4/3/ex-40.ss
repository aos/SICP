; Exercise 4.40

(define (multiple-dwelling)
  (let ((baker (amb 1 2 3 4 5))
        (cooper (amb 1 2 3 4 5)))
    (require (not (= baker 5)))
    (require (not (= cooper 1)))
    (let ((fletcher (amb 1 2 3 4 5)))
        (require (and (not (= fletcher 5))
                      (not (= fletcher 1))))
        (require
          (not (= (abs (- fletcher cooper)) 1)))
        (let ((miller (amb 1 2 3 4 5)))
          (require (> miller cooper))
          (let ((smith (amb 1 2 3 4 5)))
            (require
              (not (= (abs (- smith fletcher)) 1)))
            (require
              (distinct? (list baker cooper fletcher
                               miller smith)))
            (list (list 'baker baker)
                  (list 'cooper cooper)
                  (list 'fletcher fletcher)
                  (list 'miller miller)
                  (list 'smith smith)))))))

; Exercise 4.41

(define (require pred)
  (if (not pred)
      (multiple-dwelling)))

(define (amb . args)
  (+ 1 (random (last args))))

(define (distinct? items)
  (cond ((null? items) #t)
        ((null? (cdr items)) #t)
        ((member (car items) (cdr items)) #f)
        (else
          (distinct? (cdr items)))))

(define (multiple-dwelling)
  (let ((baker (amb 1 2 3 4 5))
        (cooper (amb 1 2 3 4 5)))
    (if (or (= baker 5)
            (= cooper 1))
        (multiple-dwelling)
        (let ((fletcher (amb 1 2 3 4 5)))
          (if (or (= fletcher 5)
                  (= fletcher 1)
                  (= (abs (- fletcher cooper)) 1))
              (multiple-dwelling)
              (let ((miller (amb 1 2 3 4 5)))
                (if (not (> miller cooper))
                    (multiple-dwelling)
                    (let ((smith (amb 1 2 3 4 5)))
                      (if (or (= (abs (- smith fletcher)) 1)
                              (not (distinct?
                                     (list baker cooper fletcher
                                           miller smith))))
                          (multiple-dwelling)
                          (list (list 'baker baker)
                                (list 'cooper cooper)
                                (list 'fletcher fletcher)
                                (list 'miller miller)
                                (list 'smith smith)))))))))))

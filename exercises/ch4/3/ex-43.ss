; Exercise 4.43

(define (fathers)
  (let ((barnacle (amb 'mary 'rosalind 'gabrielle 'lorna 'melissa)))
    (require (eq? barnacle 'melissa))
    (let ((moore (amb 'mary 'rosalind 'gabrielle 'lorna 'melissa))) 
      (require (eq? moore 'mary))
      (let ((hall (amb 'mary 'rosalind 'gabrielle 'lorna 'melissa)))
        (require (not (eq? hall 'rosalind)))
        (let ((downing (amb 'mary 'rosalind 'gabrielle 'lorna 'melissa)))
          (require (not (eq? downing 'melissa)))
          (let ((parker (amb 'mary 'rosalind 'gabrielle 'lorna 'melissa)))
            (require (not (memq parker
                                (list barnacle moore hall downing 'mary))))
            (require (distinct?
                       (list barnacle moore hall downing parker)))
            (assq 'lorna
                  (list (list 'parker parker)
                        (list 'downing downing)
                        (list 'hall hall)
                        (list 'moore moore)
                        (list 'barnacle barnacle)))))))))

; Exercise 3.72
; Sum of two squares in three different ways

(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
          (let ((s1car (stream-car s1))
                (s2car (stream-car s2)))
            (cond ((< (weight s1car)
                      (weight s2car))
                   (cons-stream
                     s1car
                     (merge-weighted (stream-cdr s1)
                                     s2
                                     weight)))
                  ((> (weight s1car)
                      (weight s2car))
                   (cons-stream
                     s2car
                     (merge-weighted s1
                                     (stream-cdr s2)
                                     weight)))
                  (else
                    (cons-stream
                      s1car
                      (merge-weighted
                        (stream-cdr s1)
                        (stream-cdr s2)
                        weight))))))))

(define (weighted-pairs s t weight)
  (cons-stream
    (list (stream-car s) (stream-car t))
    (merge-weighted
      (stream-map (lambda (x)
                    (list (stream-car s) x))
                  (stream-cdr t))
      (weighted-pairs (stream-cdr s)
                      (stream-cdr t)
                      weight)
      weight)))

(define (double-sum x) (+ (square (car x)) (square (cadr x))))

(define (three-square-sum numbers)
  (let ((n1 (stream-car numbers))
        (n2 (stream-car (stream-cdr numbers)))
        (n3 (stream-car (stream-cdr (stream-cdr numbers)))))
    (if (= (double-sum n1)
           (double-sum n2)
           (double-sum n3))
        (cons-stream
          (list (double-sum n1) n1 n2 n3)
          (three-square-sum (stream-cdr
                              (stream-cdr
                                (stream-cdr numbers)))))
        (three-square-sum (stream-cdr numbers)))))

(define three-square-sum-nums
  (three-square-sum (weighted-pairs integers integers double-sum)))

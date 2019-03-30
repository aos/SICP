; Exercise 3.71
; Ramanujan numbers

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

(define (cube x) (* x x x))
(define (triple-sum x) (+ (cube (car x)) (cube (cadr x))))

(define (rama numbers)
  (let ((n1 (stream-car numbers))
        (n2 (stream-car (stream-cdr numbers))))
    (if (= (triple-sum n1) (triple-sum n2))
        (cons-stream
          (list (triple-sum n1) n1 n2)
          (rama (stream-cdr (stream-cdr numbers))))
        (rama (stream-cdr numbers)))))

(define rama-numbers
  (rama (weighted-pairs integers integers triple-sum)))

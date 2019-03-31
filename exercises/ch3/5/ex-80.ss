; Exercise 3.80

(define (RLC R L C dt)
  (lambda (v_c0 i_l0)
    (define i_l (integral (delay di_l) i_l0 dt))
    (define v_c (integral (delay dv_c) v_c0 dt))
    (define dv_c (scale-stream i_l (/ -1 C)))
    (define di_l (add-streams
                   (scale-stream v_c (/ 1 L))
                   (scale-stream i_l (/ (- R) L))))
    (cons v_c i_l)))

(define solve ((RLC 1 1 0.2 0.1) 0 10))

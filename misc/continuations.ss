; Continuations
; ...just captured GOTOs

(define numbers '(1 2 -3 4 -5 9 8 -4 11))

(define (outer nums)
  (inner nums
         (lambda (pos neg)
           (* (fold-right + 0 pos)
              (fold-right + 0 neg)))))

(define (inner ns receive)
  (if (null? ns)
      (receive '() '())
      (inner 
        (cdr ns) 
        (lambda (pos neg)
          (let ((next-num (car ns)))
            (if (> next-num 0)
                (receive
                  (cons next-num pos) neg)
                (receive
                  pos (cons next-num neg))))))))

(outer numbers)

;; Using call/cc
(+ 4 (call-with-current-continuation
      (lambda (k) (k (+ 1 2)))))

(define x '())
(define (put-cont-in-x cont) (set! x cont))
(define print-line (lambda (x) (display x) (newline)))

(print-line (call-with-current-continuation
              put-cont-in-x))
(x "hi!")

; As early exit
(define (list-length obj)
  (call-with-current-continuation
    (lambda (cont)
      (letrec ((r (lambda (obj)
                    (cond ((null? obj) 0)
                          ((pair? obj) (+ (r (cdr obj)) 1))
                          (else (cont #f))))))
        (r obj)))))

(list-length '(1 2 3 4)) ; 4
(list-length '(a b . c)) ; #f

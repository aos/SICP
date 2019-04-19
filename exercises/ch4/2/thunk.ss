; Thunks

(define (force-it obj)
  (cond ((thunk? obj)
         (let ((result
                 (actual-value
                   (thunk-exp obj)
                   (thunk-env obj))))
           (set-car! obj 'evaluated-thunk)
           ;; replace exp with its value
           (set-car! (cdr obj) result)
           ;; forget un-needed env
           (set-cdr! (cdr obj) '())
           result))
        ((evaluated-thunk? obj)
         (thunk-value obj))
        (else obj)))

(define (delay-it exp env)
  (list 'thunk exp env))

(define (thunk? obj) (tagged-list? obj 'thunk))
(define (thunk-exp thunk) (cadr thunk))
(define (thunk-env thunk) (caddr thunk))
(define (evaluated-thunk? obj)
  (tagged-list? obj 'evaluated-thunk))
(define (thunk-value evaluated-thunk)
  (cadr evaluated-thunk))

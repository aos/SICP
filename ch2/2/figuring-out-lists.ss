; Playing around with lists to try to figure out how they are constructed
(define nil '())

(define a (list
            (list 2
                  (list
                    (list 3 6)
                    (list 9 2)))
            (list 4 4)))
(define a-c (cons
              (cons 2
                    (cons
                      (cons 3
                            (cons 6 nil))
                      (cons
                        (cons
                          (cons 9
                                (cons 2 nil))
                          nil)
                      nil)))
              (cons
                (cons 4
                      (cons 4 nil))
                nil)))

(define x (list (list 1 2) 3))
(define x-c (cons
              (cons 1
                    (cons 2 nil))
              (cons 3 nil)))

(define y (list
            (list 1 2)
            (list 3)
            4))
(define y-c (cons
              (cons 1
                    (cons 2 nil))
              (cons
                (cons 3 nil)
                (cons 4 nil))))

(define w (list
            (list 1
                  (list 3)
                  (list
                    (list 4 5)))))
(define w-c (cons
              (cons 1
                    (cons
                      (cons 3 nil)
                      (cons
                        (cons
                          (cons 4
                                (cons 5 nil))
                          nil)
                        nil)))
              nil))

(define z (list
            (list 1
                  (list
                    (list 2 3)
                    (list 4 5))
                  (list 6
                        (list 7)))
            (list 8 9)
            11))
(define z-c (cons
              (cons 1
                    (cons
                      (cons
                        (cons 2
                              (cons 3 nil))
                        (cons
                          (cons 4
                                (cons 5 nil))
                          nil))
                      (cons
                        (cons 6
                              (cons
                                (cons 7 nil)
                                nil))
                        nil)))
              (cons
                (cons 8
                      (cons 9 nil))
                (cons 11 nil))))


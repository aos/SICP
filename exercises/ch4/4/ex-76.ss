; Exercise 4.76

(define (conjoin conjuncts frame-stream)
  (define (merge-frames frame-one frame-two)
    (define (iter bindings other-frame result-frame)
      (if (null? bindings)
          result-frame
          (let ((binding (car bindings)))
            (if (binding-in-frame (binding-variable binding)
                                  result-frame)
                (iter (cdr bindings) other-frame result-frame)
                (iter
                  (cdr bindings)
                  other-frame
                  (extend-if-possible (binding-variable binding)
                                      (binding-value binding)
                                      result-frame))))))
    (let ((result-frame (iter frame-one frame-two '())))
      (iter frame-two frame-one result-frame)))

  (define (merge-frame-streams f1 f2)
    (define (can-merge? frame1 frame2)
      (define (find-mergeable-binding bindings)
        (cond ((null? bindings) #f)
              ((binding-in-frame (binding-variable (car bindings))
                                 frame2)
               #t)
              (else
                (find-mergeable-binding (cdr bindings)))))
      (find-mergeable-binding frame1))

    (define (iter s1 s2 result-list)
      (cond ((stream-null? S1) result-list)
            ((can-merge? (stream-car s1) (stream-car s2))
             (iter
               (stream-cdr s1)
               (stream-cdr s2)
               (cons-stream (merge-frames (stream-car s1)
                                          (stream-car s2))
                            result-list)))
            (else
              (iter
                (stream-cdr s1)
                (stream-cdr s2)
                (cons-stream s1 (cons-stream s2 result-list))))))
    (iter f1 f2 the-empty-stream))

  (define (merge-all-f-streams current frame-streams)
    (cond ((null? current)
           (merge-all-f-streams (car frame-streams)
                                (cdr (frame-streams))))
          ((null? frame-streams) current)
          (else
            (merge-all-f-streams
              (merge-frame-streams current (car frame-streams))
              (cdr frame-streams)))))

  (let ((all-frame-streams
          (map
            (lambda (conjunct)
              (qeval conjunct frame-stream))
            conjuncts)))
    (merge-all-f-streams '() all-frame-streams)))

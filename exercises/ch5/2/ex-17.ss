; Exercise 5.17
; This uses a modified extract-labels as found in footnote 289

(define (extract-labels text)
  (if (null? text)
      (cons '() '())
      (let* ((result (extract-labels (cdr text)))
             (insts (car result))
             (labels (cdr result))
             (next-inst (car text)))
        (if (symbol? next-inst)
            (let ((insts (if (null? insts)
                            '()
                            (cons (make-instruction-with-label
                                    (instruction-text (car insts))
                                    next-inst)
                                  (cdr insts)))))
                  (cons insts
                        (cons (make-label-entry next-inst insts) labels)))
            (cons (cons (make-instruction next-inst)
                        insts)
                  labels)))))

(define (make-instruction text)
  (list text '() '()))
(define (make-instruction-with-label text label)
  (list text label '()))
(define (instruction-text inst) (car inst))
(define (instruction-label inst) (cadr inst))
(define (instruction-execution-proc inst)
  (caddr inst))
(define (set-instruction-execution-proc!
          inst proc)
  (set-car! (cddr inst) proc))

;; Change assemble
(define (assemble controller-text machine)
  (let* ((result (extract-labels controller-text))
         (insts (car result))
         (labels (cdr result)))
    (update-insts! insts labels machine)
    insts))

;; Change machine model -- (execute)
;(if debug
;    (begin
;      (if (not (null? (instruction-label (car insts))))
;          (write-line (list "Current label:"
;                            (instruction-label (car insts))))
;          (newline))
;      (display (list "executing instruction:"
;                     (instruction-text (car insts))))
;      (newline)))

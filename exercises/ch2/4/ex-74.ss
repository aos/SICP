; Exercise 2.74

; Each division has:
; 1. Personnel records (single file)
;   - Containing: set of records keyed on employees' names
; 2. Employee records are sets, keyed under identifiers such as:
;   - 'address', 'salary'

; 'get-record'
; Each division's files should be structured such that they have the type-tag
; 'record' for each personnel file
; We need to supply the division and the employee name
(define (get-record division employee)
  ((get 'record) ((get 'division) division) employee))

; 'get-salary'
; For salary information, we will need to provide a given employee's name
; In this case, each employee record must also hold a type-tag of salary such
; that we can easily attach the (get 'salary) method
(define (get-salary employee)
  ((get 'salary) employee))

; 'find-employee-record'
; Search all the division's files for the record of a given employee
; We need to supply the employee name and the list of all division files
(define (find-employee-record employee files)
  (if (null? files)
      #f
      (or (get-record (car files) employee)
          (find-employee-record employee (cdr files)))))

; New company must provide an installation package
; This should include new (get 'record), (get 'division), and (get 'salary)
; procedures

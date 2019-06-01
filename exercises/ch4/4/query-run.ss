; Run the query evaluator

(load "../../ch3/5/pairs.ss")
(load "query-assertions.ss")
(load "query-binding.ss")
(load "query-database.ss")
(load "query-driver.ss")
(load "query-evaluator.ss")
(load "query-misc.ss")
(load "query-rules.ss")
(load "query-stream-ops.ss")
(load "query-syntax.ss")

(load "ex-74.ss") ; simple flatten
(load "ex-75.ss") ; unique

(initialize-data-base microshaft-data-base)
(query-driver-loop)

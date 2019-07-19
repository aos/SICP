(define ev-instructions
  '((assign val (op make-compiled-procedure) (label entry1083) (reg env))
  (goto (label after-lambda1082))
entry1083
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const number?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1095))
compiled-branch1094
  (assign continue (label after-call1093))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1095
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1093
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch1085))
true-branch1086
  (assign val (op lookup-variable-value) (const true) (reg env))
  (goto (reg continue))
false-branch1085
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const string?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1092))
compiled-branch1091
  (assign continue (label after-call1090))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1092
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1090
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch1088))
true-branch1089
  (assign val (op lookup-variable-value) (const true) (reg env))
  (goto (reg continue))
false-branch1088
  (assign val (op lookup-variable-value) (const false) (reg env))
  (goto (reg continue))
after-if1087
after-if1084
after-lambda1082
  (perform (op define-variable!) (const self-evaluating?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry1078) (reg env))
  (goto (label after-lambda1077))
entry1078
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const symbol?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1081))
compiled-branch1080
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1081
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1079
after-lambda1077
  (perform (op define-variable!) (const variable?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry1064) (reg env))
  (goto (label after-lambda1063))
entry1064
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp tag)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const pair?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1076))
compiled-branch1075
  (assign continue (label after-call1074))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1076
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1074
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch1066))
true-branch1067
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (save continue)
  (save proc)
  (assign val (op lookup-variable-value) (const tag) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1070))
compiled-branch1069
  (assign continue (label after-call1068))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1070
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1068
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1073))
compiled-branch1072
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1073
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1071
false-branch1066
  (assign val (op lookup-variable-value) (const false) (reg env))
  (goto (reg continue))
after-if1065
after-lambda1063
  (perform (op define-variable!) (const tagged-list?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry1059) (reg env))
  (goto (label after-lambda1058))
entry1059
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const quote))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1062))
compiled-branch1061
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1062
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1060
after-lambda1058
  (perform (op define-variable!) (const quoted?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry1054) (reg env))
  (goto (label after-lambda1053))
entry1054
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1057))
compiled-branch1056
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1057
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1055
after-lambda1053
  (perform (op define-variable!) (const text-of-quotation) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry1049) (reg env))
  (goto (label after-lambda1048))
entry1049
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const set!))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1052))
compiled-branch1051
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1052
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1050
after-lambda1048
  (perform (op define-variable!) (const assignment?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry1044) (reg env))
  (goto (label after-lambda1043))
entry1044
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1047))
compiled-branch1046
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1047
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1045
after-lambda1043
  (perform (op define-variable!) (const assignment-variable) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry1039) (reg env))
  (goto (label after-lambda1038))
entry1039
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const caddr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1042))
compiled-branch1041
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1042
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1040
after-lambda1038
  (perform (op define-variable!) (const assignment-value) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry1034) (reg env))
  (goto (label after-lambda1033))
entry1034
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const define))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1037))
compiled-branch1036
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1037
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1035
after-lambda1033
  (perform (op define-variable!) (const definition?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry1017) (reg env))
  (goto (label after-lambda1016))
entry1017
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const symbol?) (reg env))
  (save proc)
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1029))
compiled-branch1028
  (assign continue (label after-call1027))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1029
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1027
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1032))
compiled-branch1031
  (assign continue (label after-call1030))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1032
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1030
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch1019))
true-branch1020
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1026))
compiled-branch1025
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1026
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1024
false-branch1019
  (assign proc (op lookup-variable-value) (const caadr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1023))
compiled-branch1022
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1023
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1021
after-if1018
after-lambda1016
  (perform (op define-variable!) (const definition-variable) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry994) (reg env))
  (goto (label after-lambda993))
entry994
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const symbol?) (reg env))
  (save proc)
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1012))
compiled-branch1011
  (assign continue (label after-call1010))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1012
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1010
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1015))
compiled-branch1014
  (assign continue (label after-call1013))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1015
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1013
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch996))
true-branch997
  (assign proc (op lookup-variable-value) (const caddr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1009))
compiled-branch1008
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1009
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1007
false-branch996
  (assign proc (op lookup-variable-value) (const make-lambda) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cddr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1003))
compiled-branch1002
  (assign continue (label after-call1001))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1003
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call1001
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const cdadr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1000))
compiled-branch999
  (assign continue (label after-call998))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1000
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call998
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1006))
compiled-branch1005
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch1006
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call1004
after-if995
after-lambda993
  (perform (op define-variable!) (const definition-value) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry989) (reg env))
  (goto (label after-lambda988))
entry989
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const lambda))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch992))
compiled-branch991
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch992
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call990
after-lambda988
  (perform (op define-variable!) (const lambda?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry984) (reg env))
  (goto (label after-lambda983))
entry984
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch987))
compiled-branch986
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch987
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call985
after-lambda983
  (perform (op define-variable!) (const lambda-parameters) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry979) (reg env))
  (goto (label after-lambda978))
entry979
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cddr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch982))
compiled-branch981
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch982
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call980
after-lambda978
  (perform (op define-variable!) (const lambda-body) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry971) (reg env))
  (goto (label after-lambda970))
entry971
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (parameters body)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (assign val (op lookup-variable-value) (const body) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const parameters) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch974))
compiled-branch973
  (assign continue (label after-call972))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch974
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call972
  (assign argl (op list) (reg val))
  (assign val (const lambda))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch977))
compiled-branch976
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch977
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call975
after-lambda970
  (perform (op define-variable!) (const make-lambda) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry966) (reg env))
  (goto (label after-lambda965))
entry966
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const if))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch969))
compiled-branch968
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch969
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call967
after-lambda965
  (perform (op define-variable!) (const if?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry961) (reg env))
  (goto (label after-lambda960))
entry961
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch964))
compiled-branch963
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch964
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call962
after-lambda960
  (perform (op define-variable!) (const if-predicate) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry956) (reg env))
  (goto (label after-lambda955))
entry956
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const caddr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch959))
compiled-branch958
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch959
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call957
after-lambda955
  (perform (op define-variable!) (const if-consequent) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry939) (reg env))
  (goto (label after-lambda938))
entry939
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const not) (reg env))
  (save proc)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (save proc)
  (assign proc (op lookup-variable-value) (const cdddr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch948))
compiled-branch947
  (assign continue (label after-call946))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch948
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call946
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch951))
compiled-branch950
  (assign continue (label after-call949))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch951
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call949
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch954))
compiled-branch953
  (assign continue (label after-call952))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch954
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call952
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch941))
true-branch942
  (assign proc (op lookup-variable-value) (const cadddr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch945))
compiled-branch944
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch945
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call943
false-branch941
  (assign val (const false))
  (goto (reg continue))
after-if940
after-lambda938
  (perform (op define-variable!) (const if-alternative) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry934) (reg env))
  (goto (label after-lambda933))
entry934
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (predicate consequent alternative)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const alternative) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const consequent) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (op lookup-variable-value) (const predicate) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const if))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch937))
compiled-branch936
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch937
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call935
after-lambda933
  (perform (op define-variable!) (const make-if) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry929) (reg env))
  (goto (label after-lambda928))
entry929
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const begin))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch932))
compiled-branch931
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch932
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call930
after-lambda928
  (perform (op define-variable!) (const begin?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry924) (reg env))
  (goto (label after-lambda923))
entry924
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch927))
compiled-branch926
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch927
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call925
after-lambda923
  (perform (op define-variable!) (const begin-actions) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry916) (reg env))
  (goto (label after-lambda915))
entry916
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (seq)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const seq) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch919))
compiled-branch918
  (assign continue (label after-call917))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch919
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call917
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch922))
compiled-branch921
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch922
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call920
after-lambda915
  (perform (op define-variable!) (const last-exp?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry911) (reg env))
  (goto (label after-lambda910))
entry911
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (seq)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lookup-variable-value) (const seq) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch914))
compiled-branch913
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch914
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call912
after-lambda910
  (perform (op define-variable!) (const first-exp) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry906) (reg env))
  (goto (label after-lambda905))
entry906
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (seq)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const seq) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch909))
compiled-branch908
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch909
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call907
after-lambda905
  (perform (op define-variable!) (const rest-exps) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry886) (reg env))
  (goto (label after-lambda885))
entry886
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (seq)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lookup-variable-value) (const seq) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch904))
compiled-branch903
  (assign continue (label after-call902))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch904
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call902
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch888))
true-branch889
  (assign val (op lookup-variable-value) (const seq) (reg env))
  (goto (reg continue))
false-branch888
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const last-exp?) (reg env))
  (assign val (op lookup-variable-value) (const seq) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch901))
compiled-branch900
  (assign continue (label after-call899))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch901
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call899
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch891))
true-branch892
  (assign proc (op lookup-variable-value) (const first-exp) (reg env))
  (assign val (op lookup-variable-value) (const seq) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch898))
compiled-branch897
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch898
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call896
false-branch891
  (assign proc (op lookup-variable-value) (const make-begin) (reg env))
  (assign val (op lookup-variable-value) (const seq) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch895))
compiled-branch894
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch895
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call893
after-if890
after-if887
after-lambda885
  (perform (op define-variable!) (const sequence->exp) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry881) (reg env))
  (goto (label after-lambda880))
entry881
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (seq)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (assign val (op lookup-variable-value) (const seq) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const begin))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch884))
compiled-branch883
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch884
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call882
after-lambda880
  (perform (op define-variable!) (const make-begin) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry876) (reg env))
  (goto (label after-lambda875))
entry876
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const pair?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch879))
compiled-branch878
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch879
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call877
after-lambda875
  (perform (op define-variable!) (const application?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry871) (reg env))
  (goto (label after-lambda870))
entry871
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch874))
compiled-branch873
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch874
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call872
after-lambda870
  (perform (op define-variable!) (const operator) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry866) (reg env))
  (goto (label after-lambda865))
entry866
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch869))
compiled-branch868
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch869
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call867
after-lambda865
  (perform (op define-variable!) (const operands) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry861) (reg env))
  (goto (label after-lambda860))
entry861
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (ops)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lookup-variable-value) (const ops) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch864))
compiled-branch863
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch864
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call862
after-lambda860
  (perform (op define-variable!) (const no-operands?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry856) (reg env))
  (goto (label after-lambda855))
entry856
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (ops)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lookup-variable-value) (const ops) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch859))
compiled-branch858
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch859
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call857
after-lambda855
  (perform (op define-variable!) (const first-operand) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry851) (reg env))
  (goto (label after-lambda850))
entry851
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (ops)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const ops) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch854))
compiled-branch853
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch854
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call852
after-lambda850
  (perform (op define-variable!) (const rest-operands) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry846) (reg env))
  (goto (label after-lambda845))
entry846
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const cond))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch849))
compiled-branch848
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch849
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call847
after-lambda845
  (perform (op define-variable!) (const cond?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry841) (reg env))
  (goto (label after-lambda840))
entry841
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch844))
compiled-branch843
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch844
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call842
after-lambda840
  (perform (op define-variable!) (const cond-clauses) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry833) (reg env))
  (goto (label after-lambda832))
entry833
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (clause)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (save continue)
  (save proc)
  (assign val (const else))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const cond-predicate) (reg env))
  (assign val (op lookup-variable-value) (const clause) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch836))
compiled-branch835
  (assign continue (label after-call834))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch836
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call834
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch839))
compiled-branch838
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch839
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call837
after-lambda832
  (perform (op define-variable!) (const cond-else-clause?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry828) (reg env))
  (goto (label after-lambda827))
entry828
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (clause)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lookup-variable-value) (const clause) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch831))
compiled-branch830
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch831
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call829
after-lambda827
  (perform (op define-variable!) (const cond-predicate) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry823) (reg env))
  (goto (label after-lambda822))
entry823
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (clause)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const clause) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch826))
compiled-branch825
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch826
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call824
after-lambda822
  (perform (op define-variable!) (const cond-actions) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry815) (reg env))
  (goto (label after-lambda814))
entry815
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const expand-clauses) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const cond-clauses) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch818))
compiled-branch817
  (assign continue (label after-call816))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch818
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call816
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch821))
compiled-branch820
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch821
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call819
after-lambda814
  (perform (op define-variable!) (const cond->if) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry760) (reg env))
  (goto (label after-lambda759))
entry760
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (clauses)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lookup-variable-value) (const clauses) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch813))
compiled-branch812
  (assign continue (label after-call811))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch813
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call811
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch762))
true-branch763
  (assign val (const false))
  (goto (reg continue))
false-branch762
  (assign proc (op make-compiled-procedure) (label entry771) (reg env))
  (goto (label after-lambda770))
entry771
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (first rest)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const cond-else-clause?) (reg env))
  (assign val (op lookup-variable-value) (const first) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch807))
compiled-branch806
  (assign continue (label after-call805))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch807
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call805
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch773))
true-branch774
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lookup-variable-value) (const rest) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch804))
compiled-branch803
  (assign continue (label after-call802))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch804
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call802
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch791))
true-branch792
  (assign proc (op lookup-variable-value) (const sequence->exp) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const cond-actions) (reg env))
  (assign val (op lookup-variable-value) (const first) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch798))
compiled-branch797
  (assign continue (label after-call796))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch798
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call796
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch801))
compiled-branch800
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch801
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call799
false-branch791
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lookup-variable-value) (const clauses) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const ELSE clause isn't
                     last: COND->IF))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch795))
compiled-branch794
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch795
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call793
after-if790
false-branch773
  (assign proc (op lookup-variable-value) (const make-if) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const expand-clauses) (reg env))
  (assign val (op lookup-variable-value) (const rest) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch786))
compiled-branch785
  (assign continue (label after-call784))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch786
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call784
  (assign argl (op list) (reg val))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const sequence->exp) (reg env))
  (save proc)
  (assign proc (op lookup-variable-value) (const cond-actions) (reg env))
  (assign val (op lookup-variable-value) (const first) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch780))
compiled-branch779
  (assign continue (label after-call778))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch780
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call778
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch783))
compiled-branch782
  (assign continue (label after-call781))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch783
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call781
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const cond-predicate) (reg env))
  (assign val (op lookup-variable-value) (const first) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch777))
compiled-branch776
  (assign continue (label after-call775))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch777
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call775
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch789))
compiled-branch788
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch789
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call787
after-if772
after-lambda770
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const clauses) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch769))
compiled-branch768
  (assign continue (label after-call767))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch769
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call767
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lookup-variable-value) (const clauses) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch766))
compiled-branch765
  (assign continue (label after-call764))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch766
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call764
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch810))
compiled-branch809
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch810
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call808
after-if761
after-lambda759
  (perform (op define-variable!) (const expand-clauses) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry752) (reg env))
  (goto (label after-lambda751))
entry752
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (x)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const not) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (assign val (op lookup-variable-value) (const false) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const x) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch755))
compiled-branch754
  (assign continue (label after-call753))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch755
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call753
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch758))
compiled-branch757
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch758
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call756
after-lambda751
  (perform (op define-variable!) (const true?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry747) (reg env))
  (goto (label after-lambda746))
entry747
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (x)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (assign val (op lookup-variable-value) (const false) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const x) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch750))
compiled-branch749
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch750
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call748
after-lambda746
  (perform (op define-variable!) (const false?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry742) (reg env))
  (goto (label after-lambda741))
entry742
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (parameters body env)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const body) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (op lookup-variable-value) (const parameters) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const procedure))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch745))
compiled-branch744
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch745
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call743
after-lambda741
  (perform (op define-variable!) (const make-procedure) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry737) (reg env))
  (goto (label after-lambda736))
entry737
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (p)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const procedure))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const p) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch740))
compiled-branch739
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch740
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call738
after-lambda736
  (perform (op define-variable!) (const compound-procedure?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry732) (reg env))
  (goto (label after-lambda731))
entry732
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (p)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lookup-variable-value) (const p) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch735))
compiled-branch734
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch735
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call733
after-lambda731
  (perform (op define-variable!) (const procedure-parameters) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry727) (reg env))
  (goto (label after-lambda726))
entry727
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (p)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const caddr) (reg env))
  (assign val (op lookup-variable-value) (const p) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch730))
compiled-branch729
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch730
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call728
after-lambda726
  (perform (op define-variable!) (const procedure-body) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry722) (reg env))
  (goto (label after-lambda721))
entry722
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (p)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadddr) (reg env))
  (assign val (op lookup-variable-value) (const p) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch725))
compiled-branch724
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch725
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call723
after-lambda721
  (perform (op define-variable!) (const procedure-environment) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry717) (reg env))
  (goto (label after-lambda716))
entry717
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (env)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch720))
compiled-branch719
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch720
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call718
after-lambda716
  (perform (op define-variable!) (const enclosing-environment) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry712) (reg env))
  (goto (label after-lambda711))
entry712
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (env)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch715))
compiled-branch714
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch715
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call713
after-lambda711
  (perform (op define-variable!) (const first-frame) (reg val) (reg env))
  (assign val (const ok))
  (assign val (const ()))
  (perform (op define-variable!) (const the-empty-environment) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry707) (reg env))
  (goto (label after-lambda706))
entry707
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (variables values)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (assign val (op lookup-variable-value) (const values) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const variables) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch710))
compiled-branch709
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch710
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call708
after-lambda706
  (perform (op define-variable!) (const make-frame) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry702) (reg env))
  (goto (label after-lambda701))
entry702
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (frame)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lookup-variable-value) (const frame) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch705))
compiled-branch704
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch705
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call703
after-lambda701
  (perform (op define-variable!) (const frame-variables) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry697) (reg env))
  (goto (label after-lambda696))
entry697
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (frame)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const frame) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch700))
compiled-branch699
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch700
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call698
after-lambda696
  (perform (op define-variable!) (const frame-values) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry677) (reg env))
  (goto (label after-lambda676))
entry677
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (var val frame)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const set-car!) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lookup-variable-value) (const frame) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch689))
compiled-branch688
  (assign continue (label after-call687))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch689
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call687
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lookup-variable-value) (const var) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch692))
compiled-branch691
  (assign continue (label after-call690))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch692
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call690
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lookup-variable-value) (const frame) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch695))
compiled-branch694
  (assign continue (label after-call693))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch695
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call693
  (restore env)
  (restore continue)
  (assign proc (op lookup-variable-value) (const set-cdr!) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const frame) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch680))
compiled-branch679
  (assign continue (label after-call678))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch680
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call678
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lookup-variable-value) (const val) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch683))
compiled-branch682
  (assign continue (label after-call681))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch683
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call681
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lookup-variable-value) (const frame) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch686))
compiled-branch685
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch686
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call684
after-lambda676
  (perform (op define-variable!) (const add-binding-to-frame!) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry639) (reg env))
  (goto (label after-lambda638))
entry639
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (vars vals base-env)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const =) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const length) (reg env))
  (assign val (op lookup-variable-value) (const vals) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch672))
compiled-branch671
  (assign continue (label after-call670))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch672
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call670
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const length) (reg env))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch669))
compiled-branch668
  (assign continue (label after-call667))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch669
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call667
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch675))
compiled-branch674
  (assign continue (label after-call673))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch675
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call673
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch641))
true-branch642
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (save continue)
  (save proc)
  (assign val (op lookup-variable-value) (const base-env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const make-frame) (reg env))
  (assign val (op lookup-variable-value) (const vals) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch663))
compiled-branch662
  (assign continue (label after-call661))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch663
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call661
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch666))
compiled-branch665
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch666
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call664
false-branch641
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const <) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const length) (reg env))
  (assign val (op lookup-variable-value) (const vals) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch657))
compiled-branch656
  (assign continue (label after-call655))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch657
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call655
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const length) (reg env))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch654))
compiled-branch653
  (assign continue (label after-call652))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch654
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call652
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch660))
compiled-branch659
  (assign continue (label after-call658))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch660
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call658
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch644))
true-branch645
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lookup-variable-value) (const vals) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const Too many arguments supplied))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch651))
compiled-branch650
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch651
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call649
false-branch644
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lookup-variable-value) (const vals) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const Too few arguments supplied))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch648))
compiled-branch647
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch648
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call646
after-if643
after-if640
after-lambda638
  (perform (op define-variable!) (const extend-environment) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry571) (reg env))
  (goto (label after-lambda570))
entry571
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (var env)) (reg argl) (reg env))
  (assign val (op make-compiled-procedure) (label entry576) (reg env))
  (goto (label after-lambda575))
entry576
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (env)) (reg argl) (reg env))
  (assign val (op make-compiled-procedure) (label entry604) (reg env))
  (goto (label after-lambda603))
entry604
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (vars vals)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch637))
compiled-branch636
  (assign continue (label after-call635))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch637
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call635
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch606))
true-branch607
  (assign proc (op lookup-variable-value) (const env-loop) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const enclosing-environment) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch631))
compiled-branch630
  (assign continue (label after-call629))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch631
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call629
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch634))
compiled-branch633
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch634
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call632
false-branch606
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch625))
compiled-branch624
  (assign continue (label after-call623))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch625
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call623
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lookup-variable-value) (const var) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch628))
compiled-branch627
  (assign continue (label after-call626))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch628
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call626
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch609))
true-branch610
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lookup-variable-value) (const vals) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch622))
compiled-branch621
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch622
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call620
false-branch609
  (assign proc (op lookup-variable-value) (const scan) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const vals) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch616))
compiled-branch615
  (assign continue (label after-call614))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch616
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call614
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch613))
compiled-branch612
  (assign continue (label after-call611))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch613
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call611
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch619))
compiled-branch618
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch619
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call617
after-if608
after-if605
after-lambda603
  (perform (op define-variable!) (const scan) (reg val) (reg env))
  (assign val (const ok))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (assign val (op lookup-variable-value) (const the-empty-environment) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch602))
compiled-branch601
  (assign continue (label after-call600))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch602
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call600
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch578))
true-branch579
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lookup-variable-value) (const var) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const Unbound variable))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch599))
compiled-branch598
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch599
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call597
false-branch578
  (assign proc (op make-compiled-procedure) (label entry584) (reg env))
  (goto (label after-lambda583))
entry584
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (frame)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const scan) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const frame-values) (reg env))
  (assign val (op lookup-variable-value) (const frame) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch590))
compiled-branch589
  (assign continue (label after-call588))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch590
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call588
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const frame-variables) (reg env))
  (assign val (op lookup-variable-value) (const frame) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch587))
compiled-branch586
  (assign continue (label after-call585))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch587
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call585
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch593))
compiled-branch592
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch593
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call591
after-lambda583
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const first-frame) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch582))
compiled-branch581
  (assign continue (label after-call580))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch582
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call580
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch596))
compiled-branch595
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch596
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call594
after-if577
after-lambda575
  (perform (op define-variable!) (const env-loop) (reg val) (reg env))
  (assign val (const ok))
  (assign proc (op lookup-variable-value) (const env-loop) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch574))
compiled-branch573
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch574
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call572
after-lambda570
  (perform (op define-variable!) (const lookup-variable-value) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry503) (reg env))
  (goto (label after-lambda502))
entry503
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (var val env)) (reg argl) (reg env))
  (assign val (op make-compiled-procedure) (label entry508) (reg env))
  (goto (label after-lambda507))
entry508
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (env)) (reg argl) (reg env))
  (assign val (op make-compiled-procedure) (label entry536) (reg env))
  (goto (label after-lambda535))
entry536
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (vars vals)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch569))
compiled-branch568
  (assign continue (label after-call567))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch569
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call567
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch538))
true-branch539
  (assign proc (op lookup-variable-value) (const env-loop) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const enclosing-environment) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch563))
compiled-branch562
  (assign continue (label after-call561))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch563
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call561
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch566))
compiled-branch565
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch566
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call564
false-branch538
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch557))
compiled-branch556
  (assign continue (label after-call555))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch557
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call555
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lookup-variable-value) (const var) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch560))
compiled-branch559
  (assign continue (label after-call558))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch560
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call558
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch541))
true-branch542
  (assign proc (op lookup-variable-value) (const set-car!) (reg env))
  (assign val (op lookup-variable-value) (const val) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const vals) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch554))
compiled-branch553
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch554
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call552
false-branch541
  (assign proc (op lookup-variable-value) (const scan) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const vals) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch548))
compiled-branch547
  (assign continue (label after-call546))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch548
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call546
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch545))
compiled-branch544
  (assign continue (label after-call543))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch545
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call543
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch551))
compiled-branch550
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch551
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call549
after-if540
after-if537
after-lambda535
  (perform (op define-variable!) (const scan) (reg val) (reg env))
  (assign val (const ok))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (assign val (op lookup-variable-value) (const the-empty-environment) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch534))
compiled-branch533
  (assign continue (label after-call532))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch534
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call532
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch510))
true-branch511
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lookup-variable-value) (const var) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const Unbound variable: SET!))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch531))
compiled-branch530
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch531
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call529
false-branch510
  (assign proc (op make-compiled-procedure) (label entry516) (reg env))
  (goto (label after-lambda515))
entry516
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (frame)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const scan) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const frame-values) (reg env))
  (assign val (op lookup-variable-value) (const frame) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch522))
compiled-branch521
  (assign continue (label after-call520))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch522
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call520
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const frame-variables) (reg env))
  (assign val (op lookup-variable-value) (const frame) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch519))
compiled-branch518
  (assign continue (label after-call517))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch519
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call517
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch525))
compiled-branch524
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch525
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call523
after-lambda515
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const first-frame) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch514))
compiled-branch513
  (assign continue (label after-call512))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch514
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call512
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch528))
compiled-branch527
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch528
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call526
after-if509
after-lambda507
  (perform (op define-variable!) (const env-loop) (reg val) (reg env))
  (assign val (const ok))
  (assign proc (op lookup-variable-value) (const env-loop) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch506))
compiled-branch505
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch506
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call504
after-lambda502
  (perform (op define-variable!) (const set-variable-value!) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry452) (reg env))
  (goto (label after-lambda451))
entry452
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (var val env)) (reg argl) (reg env))
  (assign proc (op make-compiled-procedure) (label entry457) (reg env))
  (goto (label after-lambda456))
entry457
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (frame)) (reg argl) (reg env))
  (assign val (op make-compiled-procedure) (label entry468) (reg env))
  (goto (label after-lambda467))
entry468
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (vars vals)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const null?) (reg env))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch498))
compiled-branch497
  (assign continue (label after-call496))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch498
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call496
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch470))
true-branch471
  (assign proc (op lookup-variable-value) (const add-binding-to-frame!) (reg env))
  (assign val (op lookup-variable-value) (const frame) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const val) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (op lookup-variable-value) (const var) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch495))
compiled-branch494
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch495
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call493
false-branch470
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const eq?) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const car) (reg env))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch489))
compiled-branch488
  (assign continue (label after-call487))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch489
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call487
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lookup-variable-value) (const var) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch492))
compiled-branch491
  (assign continue (label after-call490))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch492
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call490
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch473))
true-branch474
  (assign proc (op lookup-variable-value) (const set-car!) (reg env))
  (assign val (op lookup-variable-value) (const val) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const vals) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch486))
compiled-branch485
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch486
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call484
false-branch473
  (assign proc (op lookup-variable-value) (const scan) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const vals) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch480))
compiled-branch479
  (assign continue (label after-call478))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch480
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call478
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const cdr) (reg env))
  (assign val (op lookup-variable-value) (const vars) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch477))
compiled-branch476
  (assign continue (label after-call475))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch477
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call475
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch483))
compiled-branch482
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch483
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call481
after-if472
after-if469
after-lambda467
  (perform (op define-variable!) (const scan) (reg val) (reg env))
  (assign val (const ok))
  (assign proc (op lookup-variable-value) (const scan) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const frame-values) (reg env))
  (assign val (op lookup-variable-value) (const frame) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch463))
compiled-branch462
  (assign continue (label after-call461))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch463
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call461
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const frame-variables) (reg env))
  (assign val (op lookup-variable-value) (const frame) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch460))
compiled-branch459
  (assign continue (label after-call458))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch460
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call458
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch466))
compiled-branch465
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch466
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call464
after-lambda456
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const first-frame) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch455))
compiled-branch454
  (assign continue (label after-call453))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch455
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call453
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch501))
compiled-branch500
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch501
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call499
after-lambda451
  (perform (op define-variable!) (const define-variable!) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op lookup-variable-value) (const apply) (reg env))
  (perform (op define-variable!) (const apply-in-underlying-scheme) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry336) (reg env))
  (goto (label after-lambda335))
entry336
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp env)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const self-evaluating?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch450))
compiled-branch449
  (assign continue (label after-call448))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch450
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call448
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch338))
true-branch339
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (goto (reg continue))
false-branch338
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const variable?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch447))
compiled-branch446
  (assign continue (label after-call445))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch447
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call445
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch341))
true-branch342
  (assign proc (op lookup-variable-value) (const lookup-variable-value) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch444))
compiled-branch443
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch444
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call442
false-branch341
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const quoted?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch441))
compiled-branch440
  (assign continue (label after-call439))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch441
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call439
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch344))
true-branch345
  (assign proc (op lookup-variable-value) (const text-of-quotation) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch438))
compiled-branch437
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch438
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call436
false-branch344
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const assignment?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch435))
compiled-branch434
  (assign continue (label after-call433))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch435
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call433
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch347))
true-branch348
  (assign proc (op lookup-variable-value) (const eval-assignment) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch432))
compiled-branch431
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch432
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call430
false-branch347
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const definition?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch429))
compiled-branch428
  (assign continue (label after-call427))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch429
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call427
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch350))
true-branch351
  (assign proc (op lookup-variable-value) (const eval-definition) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch426))
compiled-branch425
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch426
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call424
false-branch350
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const if?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch423))
compiled-branch422
  (assign continue (label after-call421))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch423
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call421
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch353))
true-branch354
  (assign proc (op lookup-variable-value) (const eval-if) (reg env))
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch420))
compiled-branch419
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch420
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call418
false-branch353
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const lambda?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch417))
compiled-branch416
  (assign continue (label after-call415))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch417
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call415
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch356))
true-branch357
  (assign proc (op lookup-variable-value) (const make-procedure) (reg env))
  (save continue)
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const lambda-body) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch411))
compiled-branch410
  (assign continue (label after-call409))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch411
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call409
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const lambda-parameters) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch408))
compiled-branch407
  (assign continue (label after-call406))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch408
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call406
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch414))
compiled-branch413
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch414
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call412
false-branch356
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const begin?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch405))
compiled-branch404
  (assign continue (label after-call403))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch405
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call403
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch359))
true-branch360
  (assign proc (op lookup-variable-value) (const eval-sequence) (reg env))
  (save continue)
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const begin-actions) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch399))
compiled-branch398
  (assign continue (label after-call397))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch399
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call397
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch402))
compiled-branch401
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch402
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call400
false-branch359
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const cond?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch396))
compiled-branch395
  (assign continue (label after-call394))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch396
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call394
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch362))
true-branch363
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save continue)
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const cond->if) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch390))
compiled-branch389
  (assign continue (label after-call388))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch390
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call388
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch393))
compiled-branch392
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch393
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call391
false-branch362
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const application?) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch387))
compiled-branch386
  (assign continue (label after-call385))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch387
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call385
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch365))
true-branch366
  (assign proc (op lookup-variable-value) (const apply) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const list-of-values) (reg env))
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const operands) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch378))
compiled-branch377
  (assign continue (label after-call376))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch378
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call376
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch381))
compiled-branch380
  (assign continue (label after-call379))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch381
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call379
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const operator) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch372))
compiled-branch371
  (assign continue (label after-call370))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch372
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call370
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch375))
compiled-branch374
  (assign continue (label after-call373))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch375
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call373
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch384))
compiled-branch383
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch384
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call382
false-branch365
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const Unknown expression
                   type: EVAL))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch369))
compiled-branch368
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch369
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call367
after-if364
after-if361
after-if358
after-if355
after-if352
after-if349
after-if346
after-if343
after-if340
after-if337
after-lambda335
  (perform (op define-variable!) (const eval) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry301) (reg env))
  (goto (label after-lambda300))
entry301
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (procedure arguments)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const primitive-procedure?) (reg env))
  (assign val (op lookup-variable-value) (const procedure) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch334))
compiled-branch333
  (assign continue (label after-call332))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch334
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call332
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch303))
true-branch304
  (assign proc (op lookup-variable-value) (const apply-primitive-procedure) (reg env))
  (assign val (op lookup-variable-value) (const arguments) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const procedure) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch331))
compiled-branch330
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch331
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call329
false-branch303
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const compound-procedure?) (reg env))
  (assign val (op lookup-variable-value) (const procedure) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch328))
compiled-branch327
  (assign continue (label after-call326))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch328
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call326
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch306))
true-branch307
  (assign proc (op lookup-variable-value) (const eval-sequence) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const extend-environment) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const procedure-environment) (reg env))
  (assign val (op lookup-variable-value) (const procedure) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch319))
compiled-branch318
  (assign continue (label after-call317))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch319
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call317
  (assign argl (op list) (reg val))
  (restore env)
  (assign val (op lookup-variable-value) (const arguments) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (save argl)
  (assign proc (op lookup-variable-value) (const procedure-parameters) (reg env))
  (assign val (op lookup-variable-value) (const procedure) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch316))
compiled-branch315
  (assign continue (label after-call314))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch316
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call314
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch322))
compiled-branch321
  (assign continue (label after-call320))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch322
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call320
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const procedure-body) (reg env))
  (assign val (op lookup-variable-value) (const procedure) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch313))
compiled-branch312
  (assign continue (label after-call311))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch313
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call311
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch325))
compiled-branch324
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch325
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call323
false-branch306
  (assign proc (op lookup-variable-value) (const error) (reg env))
  (assign val (op lookup-variable-value) (const procedure) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const Unknown procedure
                  type: APPLY))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch310))
compiled-branch309
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch310
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call308
after-if305
after-if302
after-lambda300
  (perform (op define-variable!) (const apply) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry278) (reg env))
  (goto (label after-lambda277))
entry278
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exps env)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const no-operands?) (reg env))
  (assign val (op lookup-variable-value) (const exps) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch299))
compiled-branch298
  (assign continue (label after-call297))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch299
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call297
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch280))
true-branch281
  (assign val (const ()))
  (goto (reg continue))
false-branch280
  (assign proc (op lookup-variable-value) (const cons) (reg env))
  (save continue)
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const list-of-values) (reg env))
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const rest-operands) (reg env))
  (assign val (op lookup-variable-value) (const exps) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch290))
compiled-branch289
  (assign continue (label after-call288))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch290
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call288
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch293))
compiled-branch292
  (assign continue (label after-call291))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch293
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call291
  (assign argl (op list) (reg val))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const first-operand) (reg env))
  (assign val (op lookup-variable-value) (const exps) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch284))
compiled-branch283
  (assign continue (label after-call282))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch284
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call282
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch287))
compiled-branch286
  (assign continue (label after-call285))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch287
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call285
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch296))
compiled-branch295
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch296
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call294
after-if279
after-lambda277
  (perform (op define-variable!) (const list-of-values) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry252) (reg env))
  (goto (label after-lambda251))
entry252
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp env)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const true?) (reg env))
  (save proc)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const if-predicate) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch270))
compiled-branch269
  (assign continue (label after-call268))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch270
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call268
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch273))
compiled-branch272
  (assign continue (label after-call271))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch273
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call271
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch276))
compiled-branch275
  (assign continue (label after-call274))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch276
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call274
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch254))
true-branch255
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save continue)
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const if-consequent) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch264))
compiled-branch263
  (assign continue (label after-call262))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch264
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call262
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch267))
compiled-branch266
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch267
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call265
false-branch254
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save continue)
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const if-alternative) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch258))
compiled-branch257
  (assign continue (label after-call256))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch258
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call256
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch261))
compiled-branch260
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch261
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call259
after-if253
after-lambda251
  (perform (op define-variable!) (const eval-if) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry226) (reg env))
  (goto (label after-lambda225))
entry226
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exps env)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const last-exp?) (reg env))
  (assign val (op lookup-variable-value) (const exps) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch250))
compiled-branch249
  (assign continue (label after-call248))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch250
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call248
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch228))
true-branch229
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save continue)
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const first-exp) (reg env))
  (assign val (op lookup-variable-value) (const exps) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch244))
compiled-branch243
  (assign continue (label after-call242))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch244
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call242
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch247))
compiled-branch246
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch247
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call245
false-branch228
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const first-exp) (reg env))
  (assign val (op lookup-variable-value) (const exps) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch238))
compiled-branch237
  (assign continue (label after-call236))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch238
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call236
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch241))
compiled-branch240
  (assign continue (label after-call239))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch241
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call239
  (restore env)
  (restore continue)
  (assign proc (op lookup-variable-value) (const eval-sequence) (reg env))
  (save continue)
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const rest-exps) (reg env))
  (assign val (op lookup-variable-value) (const exps) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch232))
compiled-branch231
  (assign continue (label after-call230))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch232
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call230
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch235))
compiled-branch234
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch235
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call233
after-if227
after-lambda225
  (perform (op define-variable!) (const eval-sequence) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry212) (reg env))
  (goto (label after-lambda211))
entry212
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp env)) (reg argl) (reg env))
  (save continue)
  (assign proc (op lookup-variable-value) (const set-variable-value!) (reg env))
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const assignment-value) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch218))
compiled-branch217
  (assign continue (label after-call216))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch218
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call216
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch221))
compiled-branch220
  (assign continue (label after-call219))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch221
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call219
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const assignment-variable) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch215))
compiled-branch214
  (assign continue (label after-call213))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch215
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call213
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch224))
compiled-branch223
  (assign continue (label after-call222))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch224
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call222
  (restore continue)
  (assign val (const ok))
  (goto (reg continue))
after-lambda211
  (perform (op define-variable!) (const eval-assignment) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry198) (reg env))
  (goto (label after-lambda197))
entry198
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (exp env)) (reg argl) (reg env))
  (save continue)
  (assign proc (op lookup-variable-value) (const define-variable!) (reg env))
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (save proc)
  (assign val (op lookup-variable-value) (const env) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const definition-value) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch204))
compiled-branch203
  (assign continue (label after-call202))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch204
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call202
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch207))
compiled-branch206
  (assign continue (label after-call205))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch207
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call205
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const definition-variable) (reg env))
  (assign val (op lookup-variable-value) (const exp) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch201))
compiled-branch200
  (assign continue (label after-call199))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch201
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call199
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch210))
compiled-branch209
  (assign continue (label after-call208))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch210
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call208
  (restore continue)
  (assign val (const ok))
  (goto (reg continue))
after-lambda197
  (perform (op define-variable!) (const eval-definition) (reg val) (reg env))
  (assign val (const ok))
  (save env)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (save proc)
  (save env)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const display) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const display))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch193))
compiled-branch192
  (assign continue (label after-call191))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch193
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call191
  (assign argl (op list) (reg val))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const newline) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const newline))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch190))
compiled-branch189
  (assign continue (label after-call188))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch190
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call188
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const list) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const list))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch187))
compiled-branch186
  (assign continue (label after-call185))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch187
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call185
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const remainder) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const remainder))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch184))
compiled-branch183
  (assign continue (label after-call182))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch184
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call182
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const not) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const not))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch181))
compiled-branch180
  (assign continue (label after-call179))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch181
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call179
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const even?) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const even?))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch178))
compiled-branch177
  (assign continue (label after-call176))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch178
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call176
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const eq?) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const eq?))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch175))
compiled-branch174
  (assign continue (label after-call173))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch175
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call173
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const <) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const <))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch172))
compiled-branch171
  (assign continue (label after-call170))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch172
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call170
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const >) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const >))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch169))
compiled-branch168
  (assign continue (label after-call167))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch169
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call167
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const =) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const =))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch166))
compiled-branch165
  (assign continue (label after-call164))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch166
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call164
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const square) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const square))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch163))
compiled-branch162
  (assign continue (label after-call161))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch163
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call161
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const -) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const -))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch160))
compiled-branch159
  (assign continue (label after-call158))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch160
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call158
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const +) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const +))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch157))
compiled-branch156
  (assign continue (label after-call155))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch157
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call155
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const *) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const *))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch154))
compiled-branch153
  (assign continue (label after-call152))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch154
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call152
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const null?) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const null?))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch151))
compiled-branch150
  (assign continue (label after-call149))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch151
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call149
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const cons) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const cons))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch148))
compiled-branch147
  (assign continue (label after-call146))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch148
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call146
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const cdr) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const cdr))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch145))
compiled-branch144
  (assign continue (label after-call143))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch145
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call143
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (assign val (op lookup-variable-value) (const car) (reg env))
  (assign argl (op list) (reg val))
  (assign val (const car))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch142))
compiled-branch141
  (assign continue (label after-call140))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch142
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call140
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch196))
compiled-branch195
  (assign continue (label after-call194))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch196
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call194
  (restore env)
  (perform (op define-variable!) (const primitive-procedures) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry136) (reg env))
  (goto (label after-lambda135))
entry136
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const ()) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const map) (reg env))
  (assign val (op lookup-variable-value) (const primitive-procedures) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const car) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch139))
compiled-branch138
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch139
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call137
after-lambda135
  (perform (op define-variable!) (const primitive-procedure-names) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry123) (reg env))
  (goto (label after-lambda122))
entry123
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const ()) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const map) (reg env))
  (assign val (op lookup-variable-value) (const primitive-procedures) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op make-compiled-procedure) (label entry125) (reg env))
  (goto (label after-lambda124))
entry125
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (proc)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lookup-variable-value) (const proc) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch128))
compiled-branch127
  (assign continue (label after-call126))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch128
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call126
  (assign argl (op list) (reg val))
  (assign val (const primitive))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch131))
compiled-branch130
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch131
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call129
after-lambda124
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch134))
compiled-branch133
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch134
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call132
after-lambda122
  (perform (op define-variable!) (const primitive-procedure-objects) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry101) (reg env))
  (goto (label after-lambda100))
entry101
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const ()) (reg argl) (reg env))
  (assign proc (op make-compiled-procedure) (label entry112) (reg env))
  (goto (label after-lambda111))
entry112
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (initial-env)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const define-variable!) (reg env))
  (assign val (op lookup-variable-value) (const initial-env) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const true) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const true))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch118))
compiled-branch117
  (assign continue (label after-call116))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch118
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call116
  (restore env)
  (restore continue)
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const define-variable!) (reg env))
  (assign val (op lookup-variable-value) (const initial-env) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const false) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const false))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch115))
compiled-branch114
  (assign continue (label after-call113))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch115
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call113
  (restore env)
  (restore continue)
  (assign val (op lookup-variable-value) (const initial-env) (reg env))
  (goto (reg continue))
after-lambda111
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const extend-environment) (reg env))
  (save proc)
  (assign val (op lookup-variable-value) (const the-empty-environment) (reg env))
  (assign argl (op list) (reg val))
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const primitive-procedure-objects) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch107))
compiled-branch106
  (assign continue (label after-call105))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch107
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call105
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const primitive-procedure-names) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch104))
compiled-branch103
  (assign continue (label after-call102))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch104
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call102
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch110))
compiled-branch109
  (assign continue (label after-call108))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch110
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call108
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch121))
compiled-branch120
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch121
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call119
after-lambda100
  (perform (op define-variable!) (const setup-environment) (reg val) (reg env))
  (assign val (const ok))
  (save env)
  (assign proc (op lookup-variable-value) (const setup-environment) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch99))
compiled-branch98
  (assign continue (label after-call97))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch99
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call97
  (restore env)
  (perform (op define-variable!) (const the-global-environment) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry93) (reg env))
  (goto (label after-lambda92))
entry93
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (proc)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const tagged-list?) (reg env))
  (assign val (const primitive))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const proc) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch96))
compiled-branch95
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch96
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call94
after-lambda92
  (perform (op define-variable!) (const primitive-procedure?) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry88) (reg env))
  (goto (label after-lambda87))
entry88
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (proc)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const cadr) (reg env))
  (assign val (op lookup-variable-value) (const proc) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch91))
compiled-branch90
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch91
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call89
after-lambda87
  (perform (op define-variable!) (const primitive-implementation) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry80) (reg env))
  (goto (label after-lambda79))
entry80
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (proc args)) (reg argl) (reg env))
  (assign proc (op lookup-variable-value) (const apply-in-underlying-scheme) (reg env))
  (save continue)
  (save proc)
  (assign val (op lookup-variable-value) (const args) (reg env))
  (assign argl (op list) (reg val))
  (save argl)
  (assign proc (op lookup-variable-value) (const primitive-implementation) (reg env))
  (assign val (op lookup-variable-value) (const proc) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch83))
compiled-branch82
  (assign continue (label after-call81))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch83
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call81
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch86))
compiled-branch85
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch86
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call84
after-lambda79
  (perform (op define-variable!) (const apply-primitive-procedure) (reg val) (reg env))
  (assign val (const ok))
  (assign val (const ";;; M-Eval input:"))
  (perform (op define-variable!) (const input-prompt) (reg val) (reg env))
  (assign val (const ok))
  (assign val (const ";;; M-Eval value:"))
  (perform (op define-variable!) (const output-prompt) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry50) (reg env))
  (goto (label after-lambda49))
entry50
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const ()) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const prompt-for-input) (reg env))
  (assign val (op lookup-variable-value) (const input-prompt) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch78))
compiled-branch77
  (assign continue (label after-call76))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch78
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call76
  (restore env)
  (restore continue)
  (save continue)
  (save env)
  (assign proc (op make-compiled-procedure) (label entry58) (reg env))
  (goto (label after-lambda57))
entry58
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (input)) (reg argl) (reg env))
  (assign proc (op make-compiled-procedure) (label entry63) (reg env))
  (goto (label after-lambda62))
entry63
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (output)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const announce-output) (reg env))
  (assign val (op lookup-variable-value) (const output-prompt) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch69))
compiled-branch68
  (assign continue (label after-call67))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch69
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call67
  (restore env)
  (restore continue)
  (assign proc (op lookup-variable-value) (const user-print) (reg env))
  (assign val (op lookup-variable-value) (const output) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch66))
compiled-branch65
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch66
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call64
after-lambda62
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const eval) (reg env))
  (assign val (op lookup-variable-value) (const the-global-environment) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const input) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch61))
compiled-branch60
  (assign continue (label after-call59))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch61
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call59
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch72))
compiled-branch71
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch72
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call70
after-lambda57
  (save proc)
  (assign proc (op lookup-variable-value) (const read) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch56))
compiled-branch55
  (assign continue (label after-call54))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch56
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call54
  (assign argl (op list) (reg val))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch75))
compiled-branch74
  (assign continue (label after-call73))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch75
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call73
  (restore env)
  (restore continue)
  (assign proc (op lookup-variable-value) (const driver-loop) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch53))
compiled-branch52
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch53
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call51
after-lambda49
  (perform (op define-variable!) (const driver-loop) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry36) (reg env))
  (goto (label after-lambda35))
entry36
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (string)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const newline) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch48))
compiled-branch47
  (assign continue (label after-call46))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch48
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call46
  (restore env)
  (restore continue)
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const newline) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch45))
compiled-branch44
  (assign continue (label after-call43))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch45
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call43
  (restore env)
  (restore continue)
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const display) (reg env))
  (assign val (op lookup-variable-value) (const string) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch42))
compiled-branch41
  (assign continue (label after-call40))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch42
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call40
  (restore env)
  (restore continue)
  (assign proc (op lookup-variable-value) (const newline) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch39))
compiled-branch38
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch39
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call37
after-lambda35
  (perform (op define-variable!) (const prompt-for-input) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry25) (reg env))
  (goto (label after-lambda24))
entry25
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (string)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const newline) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch34))
compiled-branch33
  (assign continue (label after-call32))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch34
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call32
  (restore env)
  (restore continue)
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const display) (reg env))
  (assign val (op lookup-variable-value) (const string) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch31))
compiled-branch30
  (assign continue (label after-call29))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch31
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call29
  (restore env)
  (restore continue)
  (assign proc (op lookup-variable-value) (const newline) (reg env))
  (assign argl (const ()))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch28))
compiled-branch27
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch28
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call26
after-lambda24
  (perform (op define-variable!) (const announce-output) (reg val) (reg env))
  (assign val (const ok))
  (assign val (op make-compiled-procedure) (label entry2) (reg env))
  (goto (label after-lambda1))
entry2
  (assign env (op compiled-procedure-env) (reg proc))
  (assign env (op extend-environment) (const (object)) (reg argl) (reg env))
  (save continue)
  (save env)
  (assign proc (op lookup-variable-value) (const compound-procedure?) (reg env))
  (assign val (op lookup-variable-value) (const object) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch23))
compiled-branch22
  (assign continue (label after-call21))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch23
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call21
  (restore env)
  (restore continue)
  (test (op false?) (reg val))
  (branch (label false-branch4))
true-branch5
  (assign proc (op lookup-variable-value) (const display) (reg env))
  (save continue)
  (save proc)
  (assign proc (op lookup-variable-value) (const list) (reg env))
  (save proc)
  (assign val (const <procedure-env>))
  (assign argl (op list) (reg val))
  (save env)
  (save argl)
  (assign proc (op lookup-variable-value) (const procedure-body) (reg env))
  (assign val (op lookup-variable-value) (const object) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch14))
compiled-branch13
  (assign continue (label after-call12))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch14
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call12
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (restore env)
  (save argl)
  (assign proc (op lookup-variable-value) (const procedure-parameters) (reg env))
  (assign val (op lookup-variable-value) (const object) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch11))
compiled-branch10
  (assign continue (label after-call9))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch11
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call9
  (restore argl)
  (assign argl (op cons) (reg val) (reg argl))
  (assign val (const compound-procedure))
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch17))
compiled-branch16
  (assign continue (label after-call15))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch17
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
after-call15
  (assign argl (op list) (reg val))
  (restore proc)
  (restore continue)
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch20))
compiled-branch19
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch20
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call18
false-branch4
  (assign proc (op lookup-variable-value) (const display) (reg env))
  (assign val (op lookup-variable-value) (const object) (reg env))
  (assign argl (op list) (reg val))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch8))
compiled-branch7
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
primitive-branch8
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (goto (reg continue))
after-call6
after-if3
after-lambda1
  (perform (op define-variable!) (const user-print) (reg val) (reg env))
  (assign val (const ok))))

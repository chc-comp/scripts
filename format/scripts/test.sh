#! /bin/bash

cmd="python src/format.py --check True"

function check {
  smt_file="$1"
  expected_output="$2"
  output=`$cmd $smt_file`
  if [ "$expected_output" != "$output" ] ; then
    echo "Error on $smt_file"
    echo "Expected output:"
    while read -r line ; do
      echo "| $line"
    done <<< "$expected_output"
    echo "Actual output:"
    while read -r line ; do
      echo "| $line"
    done <<< "$output"
    exit 2
  fi
}

check "test/check_err/cst_in_head.smt2" "\
Error on file test/check_err/cst_in_head.smt2
While checking clause #0
Argument 0 of application of pred is not a variable: 42\
"

check "test/check_err/distinct_vars.smt2" "\
Error on file test/check_err/distinct_vars.smt2
While checking clause #0
Illegal predicate application in head: all arguments need to be distinct variables\
"

check "test/check_err/multi_query.smt2" "\
Error on file test/check_err/multi_query.smt2
Illegal benchmark: expected one query clause, found 2\
"

check "test/check_err/query_not_last.smt2" "\
Error on file test/check_err/query_not_last.smt2
Illegal benchmark: query clause is not the last clause\
"

check "test/check_err/same_var.smt2" "\
Error on file test/check_err/same_var.smt2
While checking clause #0
Illegal tail: predicate application(s) appears after i_formula\
"

check "test/check_err/tail_is_not_conj.smt2" "\
Error on file test/check_err/tail_is_not_conj.smt2
While checking clause #0
Illegal tail: expected conjunction, got (>= (:var 1) 0)\
"

check "test/check_err/uf_in_iformula_1.smt2" "\
Error on file test/check_err/uf_in_iformula_1.smt2
While checking clause #0
Illegal i_formula: found uninterpreted symbol in i_formula\
"

check "test/check_err/uf_in_iformula_2.smt2" "\
Error on file test/check_err/uf_in_iformula_2.smt2
While checking clause #0
Illegal i_formula: found uninterpreted symbol in i_formula\
"



echo "success"
exit 0

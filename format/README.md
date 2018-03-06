Given SMT-LIB horn clauses, attempts to format the clauses to the CHC-COMP format. Original script from @dddejan.

- splits multiple-query scripts to single query ones (separated by `exit`)
- forces predicate applications' arguments to be (distinct) variables

## Setup

To setup z3:

```
pip installl -r requirements.txt
```

To test:

```
$ cat test/inline_test_00.smt2
(set-logic HORN)
(set-info :status sat)
(declare-fun p (Int) Bool)
(declare-fun q (Int) Bool)
(assert (forall ((x Int)) (=> (> x 0) (p x))))
(assert (forall ((x Int)) (=> (p x) (q x))))
(assert (forall ((x Int)) (=> (q x) (> x 0))))

$ python2.7 translate.py test/inline_test_00.smt2
(set-logic HORN)
(assert
  (forall ((A Int)) (=> (and (not (<= A 0))) (p A)))
)
(assert
  (forall ((A Int)) (=> (and (p A)) (q A)))
)
(assert
  (forall ((A Int)) (=> (and (q A) (<= A 0)) false))
)
(check-sat)
(exit)
```


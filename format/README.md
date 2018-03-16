Given SMT-LIB horn clauses, attempts to format the clauses to the CHC-COMP format. Original script from @dddejan.

- splits multiple-query scripts to single query ones (separated by `exit`)
- forces head predicate application arguments to be (distinct) variables

## Setup

To setup z3:

```
./scripts/build_z3.sh
```

## Usage

```
$ python src/format.py -h
usage: translate.py [-h] [--check True/False] [--out_dir DIR] file [file ...]

Formats and checks CHC benchmarks.

positional arguments:
  file                Files to process

optional arguments:
  -h, --help          show this help message and exit
  --check True/False  Checks that the input file(s) respect the CHC-COMP
                      format.
  --out_dir DIR       Output directory to put the result files in (stdout if
                      None).
```

To format a benchmark:

```
$ cat test/inline_test_00.smt2
(set-logic HORN)
(set-info :status sat)
(declare-fun p (Int) Bool)
(declare-fun q (Int) Bool)
(assert (forall ((x Int)) (=> (> x 0) (p x))))
(assert (forall ((x Int)) (=> (p x) (q x))))
(assert (forall ((x Int)) (=> (q x) (> x 0))))

$ python src/format.py test/inline_test_00.smt2
(set-logic HORN)

(declare-fun q ( Int ) Bool)
(declare-fun p ( Int ) Bool)

(assert
  (forall ( (x Int) )
    (=> (and (> x 0)) (p x))
  )
)
(assert
  (forall ( (x Int) )
    (=> (and (p x) true) (q x))
  )
)
(assert
  (forall ( (x Int) )
    (=> (and (q x) (not (> x 0))) false)
  )
)

(check-sat)
(exit)
```

Use `--out_dir DIR` to write the result to files in `DIR`:

```
$ python src/format.py --out_dir . test/check_err/multi_query.smt2
Writing to ./multi_query_000.smt2
Writing to ./multi_query_001.smt2
Writing to ./multi_query_002.smt2
```

Use `--check True` to check if the input file is legal:

```
$ python src/format.py --check True test/multi_query.smt2
Error on file test/check_err/multi_query.smt2
Illegal benchmark: expected one query clause, found 3

$ python src/format.py --check True test/cst_in_head.smt2
Error on file test/check_err/cst_in_head.smt2
Illegal head: argument 42 is not a variable in (pred 42 (:var 0))

$ python src/format.py test/cst_in_head.smt2 > test.smt2 ; python translate.py --check True test.smt2
success
```

The last line is actually redundant since the script systematically checks that the clauses it produces are correct.
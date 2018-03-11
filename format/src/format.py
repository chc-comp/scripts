import sys
import z3
import argparse

import check
import fix


def parse_with_z3(file, out_dir, check_only):
    lst = file.split('/')
    tmp = lst.pop()
    lst = tmp.split('.')
    base_name = lst[0]
    assert len(lst) > 0
    if len(lst) > 1:
        for stuff in lst[1:-1]:
            base_name = base_name + '.' + stuff

    t = z3.With(
        z3.Tactic("horn-simplify"),
        "xform.inline_eager",
        False,
        "xform.inline_linear",
        False,
        "xform.slice",
        False,
        "xform.coi",
        False,
        "xform.compress_unbound",
        False,
    )
    assertions = z3.parse_smt2_file(file)
    goals = z3.Goal()
    goals.add(assertions)

    if check_only:
        check.check_chcs(goals)
        print("success")
    else:
        simplified = t(goals)
        clauses = []
        queries = []
        if len(simplified) == 0:
            raise Exception(
                'Empty benchmark, ' +
                'possibly because it is solved trivial by pre-processing'
            )

        for index, clause in enumerate(simplified[0]):
            try:
                clause, is_query = fix.fix_clause(clause)
                if is_query:
                    queries.append(clause)
                else:
                    clauses.append(clause)
            except Exception as e:
                raise Exception(
                    'While fixing clause {}:\n{}'.format(index, e.args)
                )

        if len(queries) < 1:
            raise Exception(
                'No query clause found'
            )

        for cnt, query in enumerate(queries):
            these_clauses = []
            for clause in clauses:
                these_clauses.append(clause)
            these_clauses.append(query)
            goals = z3.Solver()
            goals.add(these_clauses)
            if out_dir is None:
                print('(set-logic HORN)\n')
                print(goals.sexpr())
                print('(check-sat)')
                print('(exit)')
            else:
                out_file = "{}/{}_{:0>3}.smt2".format(
                    out_dir, base_name, cnt
                )
                print('Writing to {}'.format(out_file))
                out_file = open(out_file, mode='w')
                out_file.write('(set-logic HORN)\n\n')
                out_file.write(goals.sexpr())
                out_file.write('\n\n(check-sat)\n')
                out_file.write('(exit)\n')
            try:
                check.check_chcs(these_clauses)
            except check.CheckExc as e:
                raise Exception(
                    "Result of formatting is ill-formed:\n{}".format(e.args)
                )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Formats and checks CHC benchmarks.'
    )
    parser.add_argument(
        '--check',
        dest='check',
        metavar='True/False',
        help='Checks that the input file(s) respect the CHC-COMP format.',
    )
    parser.add_argument(
        '--out_dir',
        dest='out_dir',
        metavar='DIR',
        help='Output directory to put the result files in (stdout if None).',
    )
    parser.add_argument(
        'file',
        nargs='+',
        help='Files to process'
    )
    args = parser.parse_args()

    if args.out_dir == "None":
        args.out_dir = None

    for file in args.file:
        try:
            parse_with_z3(file, args.out_dir, args.check)
        except Exception as e:
            print('Error on file {}'.format(file))
            print(e)
            sys.exit(2)

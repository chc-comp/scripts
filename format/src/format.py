import sys
import z3
import argparse

from util import Skip, Exc, eprint
from util import write_clauses_smt2, write_clauses_datalog
import check
import fix


def parse_with_z3(
    file, out_dir, check_only, split_queries, merge_queries,
        simplify, skip_err, datalog
):
    if check_only:
        assertions = z3.parse_smt2_file(file)
        check.check_chcs(assertions.children())
        print("success")
        return
    lst = file.split('/')
    tmp = lst.pop()
    lst = tmp.split('.')
    base_name = lst[0]
    assert len(lst) > 0
    if len(lst) > 1:
        for stuff in lst[1:-1]:
            base_name = base_name + '.' + stuff

    # Check if the file is actually in datalog.
    engine = z3.Fixedpoint()
    engine.set(
        "xform.inline_eager",
        simplify,
        "xform.inline_linear",
        simplify,
        "xform.slice",
        simplify,
        "xform.coi",
        simplify,
        "xform.compress_unbound",
        simplify,
        "xform.subsumption_checker",
        simplify,
        "xform.tail_simplifier_pve",
        simplify
    )
    try:
        queries = engine.parse_file(file)
    except z3.Z3Exception as e:
        raise Exc('Parse error on file {}'.format(file))

    assertions = engine.get_assertions()
    for rule in engine.get_rules():
        assertions.push(rule)
    for query in queries:
        assertions.push(z3.Implies(query, False))

    # engine.get_assertions()
    goals = z3.Goal()
    goals.add(assertions)

    non_lin = z3.Probe('arith-max-deg')
    if non_lin(goals) > 1:
        raise Skip(
            'found non-linear expressions'
        )

    # if simplify:
    tactic = z3.Tactic("horn-simplify")
    simplified = tactic(
        goals,
        "xform.inline_eager",
        simplify,
        "xform.inline_linear",
        simplify,
        "xform.slice",
        simplify,
        "xform.coi",
        simplify,
        "xform.compress_unbound",
        simplify,
        "xform.subsumption_checker",
        simplify,
        "xform.tail_simplifier_pve",
        simplify
    )

    # else:
    #     simplified = [goals]
    clauses = []
    queries = []
    if len(simplified) == 0:
        raise Skip(
            'empty benchmark (possibly because of pre-processing)'
        )

    pred_decls = set()

    for index, clause in enumerate(simplified[0]):
        try:
            clause, is_query = fix.fix_clause(clause, pred_decls)
            if is_query:
                queries.append(clause)
            else:
                clauses.append(clause)
        except Exc as e:
            raise Exc(
                'While fixing clause {}:\n{}'.format(index, e.value)
            )

    if len(queries) < 1:
        raise Skip('no query clause (possibly because of pre-processing)')

    if merge_queries:
        fix.merge_queries_new_pred(clauses, queries, pred_decls)

    separated_clauses = []

    if split_queries:

        for cnt, query in enumerate(queries):
            these_clauses = []
            for clause in clauses:
                these_clauses.append(clause)
            these_clauses.append(query)

            separated_clauses.append(these_clauses)

    else:

        for query in queries:
            clauses.append(query)

        separated_clauses.append(clauses)

    cnt = 0

    for clauses in separated_clauses:

        if out_dir is not None:
            out_file = "{}/{}_{:0>3}.smt2".format(
                out_dir, base_name, cnt
            )
            cnt += 1
            print('Writing to {}'.format(out_file))
            writer = open(out_file, mode='w')
        else:
            writer = sys.stdout

        if split_queries:
            try:
                check.check_chcs(clauses)
            except Exc as e:
                exc = Exc(
                    'Result of formatting is ill-formed:\n{}'.format(e.value)
                )
                if skip_err:
                    eprint('Error on file {}'.format(file))
                    eprint(exc.value)
                    continue
                else:
                    raise exc

        if datalog:
            write_clauses_datalog(pred_decls, clauses, writer)
        else:
            write_clauses_smt2(pred_decls, clauses, writer)


def check_bool_clap(value, blah):
    if value == "True":
        return True
    elif value == "False":
        return False
    else:
        print(
            'Unexpected non-boolean value for argument {}: {}'.format(
                blah, args.simplify
            )
        )
        exit(2)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Formats and checks CHC benchmarks.'
    )
    parser.add_argument(
        '--check',
        dest='check',
        metavar='True/False',
        default="False",
        help='Checks that the input file(s) respect the CHC-COMP format.',
    )
    parser.add_argument(
        '--simplify',
        dest='simplify',
        metavar='True/False',
        default="False",
        help='Activates z3\'s simplifications (ignored by check).',
    )
    parser.add_argument(
        '--skip_errors',
        dest='skip_err',
        metavar='True/False',
        default='False',
        help='Prints errors but does not stop the script.'
    )
    parser.add_argument(
        '--datalog',
        dest='datalog',
        metavar='True/False',
        default='False',
        help='Output benchmark in datalog format.'
    )
    parser.add_argument(
        '--split_queries',
        dest='split_queries',
        metavar='True/False',
        default='True',
        help='Split the queries to generate separate benchmarks.'
    )
    parser.add_argument(
        '--merge_queries',
        dest='merge_queries',
        metavar='True/False',
        default='False',
        help='Merge multiple queries into a single query (introduces a new nullary predicate).'
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

    args.simplify = check_bool_clap(args.simplify, "simplify")
    args.check = check_bool_clap(args.check, "check")
    args.skip_err = check_bool_clap(args.skip_err, "skip_err")
    args.datalog = check_bool_clap(args.datalog, "datalog")
    args.split_queries = check_bool_clap(args.split_queries, "split_queries")
    args.merge_queries = check_bool_clap(args.merge_queries, "merge_queries")

    for file in args.file:
        try:
            parse_with_z3(
                file, args.out_dir, args.check,
                args.split_queries, args.merge_queries,
                args.simplify, args.skip_err, args.datalog
            )
        except Exc as e:
            eprint('Error on file {}'.format(file))
            eprint(e.value)
            sys.exit(2)
        except Skip as e:
            print('Skipping file {}:'.format(file))
            print(e.value)

import sys
import z3
import argparse
from sets import Set

from util import Exc, clause_to_str, pred_decl_to_str
import check
import fix


def parse_with_z3(file, out_dir, check_only, simplify):
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
    queries = engine.parse_file(file)

    assertions = engine.get_assertions()
    for rule in engine.get_rules():
        assertions.push(rule)
    for query in queries:
        assertions.push(z3.Implies(query, False))

    # engine.get_assertions()
    goals = z3.Goal()
    goals.add(assertions)

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
        raise Exc(
            'Empty benchmark, ' +
            'possibly because it is solved trivial by pre-processing'
        )

    pred_decls = Set()

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
        print('No query clause found for {}, skipping.'.format(file))
        return

    for cnt, query in enumerate(queries):
        these_clauses = []
        for clause in clauses:
            these_clauses.append(clause)
        these_clauses.append(query)

        writer = sys.stdout

        if out_dir is not None:
            out_file = "{}/{}_{:0>3}.smt2".format(
                out_dir, base_name, cnt
            )
            print('Writing to {}'.format(out_file))
            writer = open(out_file, mode='w')

        try:
            check.check_chcs(these_clauses)
        except Exc as e:
            raise Exc(
                'Result of formatting is ill-formed:\n{}'.format(e.value)
            )

        writer.write('(set-logic HORN)\n\n')
        for decl in pred_decls:
            writer.write(pred_decl_to_str(decl))
            writer.write('\n')
        writer.write('\n')
        for clause in these_clauses:
            writer.write('(assert\n')
            writer.write(clause_to_str(clause, '  '))
            writer.write('\n)\n')
        writer.write('\n')
        writer.write('(check-sat)\n')
        writer.write('(exit)\n')


def check_bool_clap(value, blah):
    if value == "True":
        return True
    elif value == "False":
        return False
    else:
        print 'Unexpected non-boolean value for argument {}: {}'.format(
            blah, args.simplify
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

    for file in args.file:
        try:
            parse_with_z3(file, args.out_dir, args.check, args.simplify)
        except Exc as e:
            print('Error on file {}'.format(file))
            print(e.value)
            sys.exit(2)
        # except z3.Z3Exception as e:
        #     print('Parse error on file {}'.format(file))
        #     print(e)
        #     sys.exit(2)

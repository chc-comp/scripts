import z3
import argparse
from sets import Set


def check_clause(clause):
    assert(
        z3.is_quantifier(clause)
    ), 'expected clause, found {}'.format(clause)
    assert(
        clause.is_forall()
    ), 'expected universal quantifier, found {}'.format(clause)


def check_implies(implies):
    assert(
        implies.decl().kind() == z3.Z3_OP_IMPLIES
    ), 'expected implication under quantifier, found {}'.format(implies)
    assert(
        len(implies.children()) == 2
    ), 'expected implication with 2 subterms, found {}'.format(implies)


def fix_expr(expr):
    if expr.decl().kind == z3.Z3_OP_AND:
        kids = [fix_expr(kid) for kid in expr.children()]
        z3.mk_and(kids)
    else:
        raise Exception('unimplemented')


def get_conjuncts(qvars, conjunction):
    if conjunction.decl().kind() == z3.Z3_OP_AND:
        return [
            z3.substitute_vars(kid, * qvars)
            for kid in conjunction.children()
        ]
    else:
        return [z3.substitute_vars(conjunction, * qvars)]


def extract_implies(clause):
    check_clause(clause)
    qvars = [
        z3.Const(clause.var_name(n), clause.var_sort(n)) for n in range(
            0, clause.num_vars()
        )
    ]

    implies = clause.body()
    check_implies(implies)
    kids = implies.children()
    body = get_conjuncts(qvars, kids[0])
    head = z3.substitute_vars(kids[1], * qvars)

    return {
        'qvars': qvars,
        'body': body,
        'head': head,
    }


def print_context(context, pref=''):
    print '{}forall {}'.format(
        pref, ', '.join(
            ['{}: {}'.format(qv, qv.sort()) for qv in context['qvars']]
        )
    )
    for conjunct in context['body']:
        print '{}   {}'.format(pref, conjunct)
    print '{}=> {}'.format(pref, context['head'])


def get_fresh(qvars, sort):
    ident = 'v_{}'.format(len(qvars))
    return z3.Const(ident, sort)


def fix_pred_app(qvars, expr):
    terms = []
    if expr.decl().kind() == z3.Z3_OP_UNINTERPRETED:
        # print 'fixing {}'.format(expr)
        known_vars = Set([])
        kids = []
        for kid in expr.children():
            if z3.is_const(kid):
                if kid not in known_vars:
                    known_vars.add(kid)
                    kids.append(kid)
                    continue
            # Not a var, or a var we already saw.
            fresh = get_fresh(qvars, kid.sort())
            # print '  introducing {}'.format(fresh)
            qvars.append(fresh)
            eq = fresh == kid
            # print '  {}'.format(eq)
            terms.append(eq)
            kids.append(fresh)
        expr = expr.decl()(kids)

    return (qvars, expr, terms)


def fix_clause(clause):
    context = extract_implies(clause)
    # print 'working on'
    # print_context(context, pref='  ')

    qvars = context['qvars']
    body_terms = []
    for expr in context['body']:
        res = fix_pred_app(qvars, expr)
        qvars = res[0]
        body_terms.append(res[1])
        for term in res[2]:
            body_terms.append(term)

    res = fix_pred_app(qvars, context['head'])
    qvars = res[0]
    head = res[1]
    for term in res[2]:
        body_terms.append(term)
    body = z3.And(body_terms)
    query = head.decl().kind() != z3.Z3_OP_UNINTERPRETED
    implies = z3.Implies(body, head)

    quantified = z3.ForAll(qvars, implies)

    # print(quantified)

    return (quantified, query)


def print_clause(clause):
    print '(assert'
    print '  {}'.format(clause.sexpr())
    print ')'


def parse_with_z3(file):
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
    simplified = t(goals)
    clauses = []
    queries = []

    for clause, is_query in [fix_clause(clause) for clause in simplified[0]]:
        if is_query:
            queries.append(clause)
        else:
            clauses.append(clause)

    for query in queries:
        print('(set-logic HORN)')
        for clause in clauses:
            print_clause(clause)
        print_clause(query)
        print '(check-sat)'
        print '(exit)'


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Translate horn problems from SMT2 to other formats.'
    )
    parser.add_argument(
        '--output-format',
        dest='output_format',
        metavar='FORMAT',
        help='Output format: mcmt',
    )
    parser.add_argument(
        'file',
        nargs='+',
        help='Files to process'
    )
    args = parser.parse_args()

    for file in args.file:
        parse_with_z3(file)

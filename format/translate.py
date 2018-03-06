import z3
import argparse
from sets import Set
import util


def i_formula(expr):
    list = []

    def i_formula_node(expr):
        if not z3.is_var(expr) and not z3.is_const(expr):
            decl = expr.decl()
            if decl.kind() == z3.Z3_OP_UNINTERPRETED:
                list.append(False)
    util.foreach_expr(i_formula_node, expr)

    return all(list)


def u_predicate(expr):
    if z3.is_const(expr) and expr.decl().kind() == z3.Z3_OP_UNINTERPRETED:
        return True
    decl = expr.decl()
    if decl is None or decl.kind() != z3.Z3_OP_UNINTERPRETED:
        return False
    for kid in expr.children():
        i_formula(kid)
    return True


def check_chc_tail(expr):
    decl = expr.decl()
    if decl is None or decl.kind() != z3.Z3_OP_AND:
        if not u_predicate(expr) and not i_formula(expr):
            raise Exception(
                "illegal chc tail: expected u_predicate or i_formula, " +
                "got {}".format(expr.sexpr())
            )
    else:
        for kid in expr.children():
            if not u_predicate(kid) and not i_formula(kid):
                raise Exception(
                    "illegal conjunct in tail: {}".format(kid.sexpr())
                )
    return True


# Returns true if the head is an i_formula (query clause)
def check_chc_head(expr):
    if u_predicate(expr):
        decl = expr.decl()
        if decl is not None:
            known_vars = Set([])
            for kid in expr.children():
                if not z3.is_var(kid):
                    raise Exception(
                        "illegal head: " +
                        "argument {} is not a variable {}".format(
                            expr.sexpr(), kid.sexpr()
                        )
                    )
                index = z3.get_var_index(kid)
                if index in known_vars:
                    raise Exception(
                        "illegal head: non-distinct arguments, " +
                        "{} is used twice in {}".format(
                            kid.sexpr(), expr.sexpr()
                        )
                    )
                known_vars.add(z3.get_var_index(kid))
        return False
    elif expr == z3.BoolVal(False):
        return True
    else:
        raise Exception(
            "illegal head: {}".format(expr.sexpr())
        )


# Return true if the clause is a query.
def check_chc(expr):
    if not z3.is_quantifier(expr) or not expr.is_forall():
        raise Exception(
            "illegal chc: expected forall, got {}".format(expr.sexpr())
        )
    implies = expr.body()
    decl = implies.decl()
    if decl is None or decl.kind() != z3.Z3_OP_IMPLIES:
        raise Exception(
            "illegal chc: expected implication, got {}".format(implies.sexpr())
        )
    check_chc_tail(implies.children()[0])
    is_query = check_chc_head(implies.children()[1])
    return is_query


def check_chcs(exprs):
    query_count = 0
    for expr in exprs:
        is_query = check_chc(expr)
        if is_query:
            query_count += 1
        elif not is_query and query_count > 0:
            raise Exception(
                "Illegal benchmark: " +
                "query clause is not the last clause"
            )
    if query_count != 1:
        raise Exception(
            "illegal benchmark: " +
            "expected one query clause, found {}".format(query_count)
        )


def fix_quantifier(clause):
    if z3.is_quantifier(clause):
        assert(
            clause.is_forall()
        ), 'expected universal quantifier, found {}'.format(clause.sexpr())
        return clause
    else:
        return z3.ForAll(z3.Const("CHC-COMP::unused", z3.IntSort()), clause)


def fix_implies(implies):
    if implies.decl().kind() != z3.Z3_OP_IMPLIES:
        return z3.Implies(z3.BoolVal(True), implies)
    else:
        return implies


def fix_expr(expr):
    if expr.decl().kind == z3.Z3_OP_AND:
        kids = [fix_expr(kid) for kid in expr.children()]
        z3.mk_and(kids)
    else:
        raise Exception('unimplemented')


def get_conjuncts(subs, conjunction):
    if conjunction.decl().kind() == z3.Z3_OP_AND:
        return [
            z3.substitute(kid, subs)
            for kid in conjunction.children()
        ]
    else:
        return [z3.substitute(conjunction, subs)]



def extract_implies(clause):
    clause = fix_quantifier(clause)

    subs=[]
    for i, var in enumerate(util.find_vars(clause)):
        subs.append((var, z3.Const('c!!'+str(i), var.sort())))
    if len(subs)==0:
        assert(clause.num_vars()==1)
        subs.append((z3.Var(0, clause.var_sort(0)),
                    z3.Const(clause.var_name(0), clause.var_sort(0))))

    implies = fix_implies(clause.body())
    kids = implies.children()
    body = get_conjuncts(subs, kids[0])
    head = z3.substitute(kids[1], *subs)

    return {
        'qvars': [v[1] for v in subs],
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
            if z3.is_const(
                kid
            ) and kid.decl().kind() == z3.Z3_OP_UNINTERPRETED:
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
    body_exprs = []
    for expr in context['body']:
        # res = fix_pred_app(qvars, expr)
        # qvars = res[0]
        # body_exprs.append(res[1])
        # for expr in res[2]:
        #     body_exprs.append(expr)
        body_exprs.append(expr)

    res = fix_pred_app(qvars, context['head'])
    qvars = res[0]
    head = res[1]
    for expr in res[2]:
        body_exprs.append(expr)
    if len(body_exprs) > 1:
        body = z3.And(body_exprs)
    elif len(body_exprs) == 1:
        body = body_exprs[0]
    else:
        raise Exception('unexpected empty clause body')
    query = head.decl().kind() != z3.Z3_OP_UNINTERPRETED
    implies = z3.Implies(body, head)

    quantified = z3.ForAll(qvars, implies)

    # print(quantified)

    return (quantified, query)


def parse_with_z3(file, out_dir, check_only, fixedpoint):
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
    if fixedpoint:
        f = z3.Fixedpoint()
        query = f.parse_file(file)
        f.add_rule(False, query[0])
        assertions = z3.And(f.get_rules())
    else:
        assertions = z3.parse_smt2_file(file)
    goals = z3.Goal()
    goals.add(assertions)

    if check_only:
        check_chcs(goals)
        print "success"
    else:
        simplified = t(goals)
        clauses = []
        queries = []
        for clause, is_query in [
            fix_clause(clause) for clause in simplified[0]
        ]:
            if is_query:
                queries.append(clause)
            else:
                clauses.append(clause)

        for cnt, query in enumerate(queries):
            these_clauses = []
            for clause in clauses:
                these_clauses.append(clause)
            these_clauses.append(query)
            goals = z3.Solver()
            goals.add(these_clauses)
            if out_dir is None:
                print('(set-logic HORN)')
                print goals.sexpr()
                print '(check-sat)'
                print '(exit)'
            else:
                out_file = "{}/{}_{:0>3}.smt2".format(
                    out_dir, base_name, cnt
                )
                print 'Writing to {}'.format(out_file)
                out_file = open(out_file, mode='w')
                out_file.write('(set-logic HORN)\n\n')
                out_file.write(goals.sexpr())
                out_file.write('\n\n(check-sat)\n')
                out_file.write('(exit)\n')
            try:
                check_chcs(these_clauses)
            except Exception, blah:
                raise Exception(
                    "Result of formatting is ill-formed:\n{}".format(blah)
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
        '--fixedpoint',
        dest='fixedpoint',
        action='store_true',
        help='Input files are in fixedpoint format.',
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
            parse_with_z3(file, args.out_dir, args.check, args.fixedpoint)
        except Exception, text:
            print 'Error on file {}'.format(file)
            print text
            exit(2)

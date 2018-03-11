import z3
from sets import Set


def fix_implies(implies):
    if implies.decl().kind() != z3.Z3_OP_IMPLIES:
        return z3.Implies(z3.BoolVal(True), implies)
    else:
        return implies


def fix_quantifier(expr):
    if z3.is_quantifier(expr):
        assert(
            expr.is_forall()
        ), 'expected universal quantifier, found {}'.format(expr.sexpr())
        qvars = [
            z3.Const(expr.var_name(n), expr.var_sort(n)) for n in range(
                0, expr.num_vars()
            )
        ]
        return qvars, fix_implies(expr.body())
    else:
        return [], fix_implies(expr)


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
    qvars, implies = fix_quantifier(clause)
    kids = implies.children()
    body = get_conjuncts(qvars, kids[0])
    head = z3.substitute_vars(kids[1], * qvars)

    return {
        'qvars': qvars,
        'body': body,
        'head': head,
    }


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

    if len(qvars) == 0:
        return (implies, query)
    else:
        return (z3.ForAll(qvars, implies), query)

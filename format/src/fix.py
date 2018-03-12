import z3
from sets import Set

from util import Exc, is_pred_app, make_and


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
    tail = get_conjuncts(qvars, kids[0])
    head = z3.substitute_vars(kids[1], * qvars)

    return {
        'qvars': qvars,
        'tail': tail,
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

    return (qvars, expr, terms, expr.decl())


def fix_clause(clause, pred_decls):
    context = extract_implies(clause)
    # print 'working on'
    # print_context(context, pref='  ')

    qvars = context['qvars']
    tail = []
    tail_atoms = []
    for expr in context['tail']:
        if is_pred_app(expr):
            res = fix_pred_app(qvars, expr)
            qvars = res[0]
            tail.append(res[1])
            for expr in res[2]:
                tail_atoms.append(expr)
            pred_decls.add(res[3])
        else:
            tail_atoms.append(expr)

    head = z3.BoolVal(False)

    if is_pred_app(context['head']):
        res = fix_pred_app(qvars, context['head'])
        qvars = res[0]
        head = res[1]
        pred_decls.add(res[3])
        for atom in res[2]:
            if not is_pred_app(atom):
                raise Exc(
                    'Unexpected fix_pred_app result'
                )
            tail_atoms.append(atom)
    elif not z3.is_false(context['head']):
        tail_atoms.append(
            z3.Not(context['head'])
        )

    tail.append(make_and(tail_atoms))
    if len(tail) == 0:
        raise Exc(
            'Internal error, unexpected empty tail'
        )

    query = head.decl().kind() != z3.Z3_OP_UNINTERPRETED
    implies = z3.Implies(z3.And(tail), head)

    if len(qvars) == 0:
        return (
            z3.ForAll(z3.Bool("CHC_COMP_UNUSED"), implies),
            query
        )
    else:
        return (z3.ForAll(qvars, implies), query)

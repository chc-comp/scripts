import z3


class Exc(Exception):
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return repr(self.value)


def is_pred_app(expr):
    return (
        not z3.is_var(expr) and
        z3.is_expr(expr) and
        expr.decl().kind() == z3.Z3_OP_UNINTERPRETED
    )


def make_and(exprs):
    if len(exprs) > 1:
        return z3.And(exprs)
    elif len(exprs) == 1:
        return exprs[0]
    else:
        return z3.BoolVal(True)


def foreach_expr(fn, expr, *args, **kwargs):
    """Applies a given function to each sub-expression of the input expr"""
    _foreach_expr(fn, expr, z3.AstMap(), *args, **kwargs)


def _foreach_expr(fn, expr, visited, *args, **kwargs):
    """Helper function for foreach_expr"""
    if expr in visited:
        return

    visited[expr] = expr

    fn(expr, *args, **kwargs)

    for k in expr.children():
        _foreach_expr(fn, k, visited, *args, **kwargs)


def find_vars(ast):
    """Returns the set of all variables in a given expression"""
    vars = list()

    def add(expr):
        if z3.is_var(expr):
            vars.append(expr)

    foreach_expr(add, ast)

    return sorted(vars, lambda x, y: z3.get_var_index(x) - z3.get_var_index(y))


def pred_decl_to_str(decl):
    string = "(declare-fun {} (".format(decl.name())
    for n in range(0, decl.arity()):
        string += (" {}".format(decl.domain(n)))
    string += " ) {})".format(decl.range())
    return string


def clause_to_str(forall, pref):
    if not (z3.is_quantifier(forall) and forall.is_forall()):
        raise Exception(
            "Illegal clause for clause_to_str: {}".format(forall.decl())
        )

    string = "{}(forall (".format(pref)

    for idx in range(0, forall.num_vars()):
        string += " ({} {})".format(
            forall.var_name(idx), forall.var_sort(idx).sexpr()
        )

    string += " ) \n{} ".format(pref)

    stack = [(forall.body(), "")]
    # to print^^^^^^^^^^^^^  ^^~~~suffix

    while len(stack) > 0:
        expr, suff = stack.pop()
        if z3.is_var(expr):
            string += " {}{}".format(
                forall.var_name(z3.get_var_index(expr)), suff
            )
        elif z3.is_const(expr):
            string += " {}{}".format(expr.sexpr(), suff)
        else:
            string += " ({}".format(expr.decl().name())
            kids = expr.children()
            suff = "){}".format(suff)
            for kid in reversed(kids):
                stack.append((kid, suff))
                suff = ""

    string += "\n{})".format(pref)

    return string

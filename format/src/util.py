from __future__ import print_function
import sys
import z3


def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


class Exc(Exception):
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return repr(self.value)


class Skip(Exception):
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

# get all datatypes used in the definition of dt
def get_all_deps(dt):
    if not isinstance(dt, z3.DatatypeSortRef):
        return set()
    deps = {dt}
    n = dt.num_constructors()
    for i in range(n):
        c = dt.constructor(i)
        m = c.arity()
        for j in range(m):
            s = c.domain(j)
            if isinstance(s, z3.DatatypeSortRef):
                if s in deps:
                    continue
                deps.add(s)
                deps_new = get_all_deps(deps)
                deps.update(deps_new)
            elif isinstance(s, z3.ArraySortRef):
                deps.update(get_all_deps(s.domain()))
                deps.update(get_all_deps(s.range()))
    return deps

#TODO: collect datatypes from expressions as well, not just quantified variables
def collect_datatypes(clause, datatype):
    assert clause.is_forall()
    n = clause.num_vars()
    for i in range(n):
        s = clause.var_sort(i)
        if isinstance(s, z3.DatatypeSortRef):
            datatype.add(s)
            datatype.update(get_all_deps(s))
        if isinstance(s, z3.ArraySortRef):
            datatype.update(get_all_deps(s.domain()))
            datatype.update(get_all_deps(s.range()))

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


def quote_symbol_if_needed(symbol):
    for char in symbol:
        if not char.isalnum() or char not in [
            '~' '!' '@' '$' '%' '^' '&' '*' '_' '-' '+' '=' '<' '>' '.' '?' '/'
        ]:
            return '|{}|'.format(symbol)
    return '{}'.format(symbol)


def write_pred_decl(decl, writer):
    symbol = quote_symbol_if_needed(decl.name())
    writer.write("(declare-fun {} (".format(symbol))
    for n in range(0, decl.arity()):
        writer.write((" {}".format(decl.domain(n).sexpr())))
    writer.write(" ) {})".format(decl.range().sexpr()))


def write_implication_smt2(implication, pref, false_subst, writer):
    assert implication.decl().kind() == z3.Z3_OP_IMPLIES
    assert len(implication.children()) == 2

    writer.write("{}(=>\n".format(pref))

    tail = implication.children()[0]
    head = implication.children()[1]

    assert tail.decl().kind() == z3.Z3_OP_AND
    writer.write("{}  (and\n".format(pref))
    for kid in tail.children():
        writer.write("{}    ".format(pref))
        writer.write(kid.sexpr())
        writer.write('\n')
    writer.write("{}  )\n{}  ".format(pref, pref))
    if z3.is_false(head) and false_subst is not None:
        writer.write(false_subst)
    else:
        writer.write(head.sexpr())
    writer.write("\n{})".format(pref))


def write_clause_smt2(forall, pref, writer):
    if not (z3.is_quantifier(forall) and forall.is_forall()):
        raise Exception(
            "Illegal clause for write_clause_smt2: {}".format(forall.decl())
        )

    writer.write("{}(forall (".format(pref))

    for idx in range(0, forall.num_vars()):
        writer.write(" ({} {})".format(
            forall.var_name(idx), forall.var_sort(idx).sexpr()
        ))

    writer.write(" ) \n".format(pref))

    implication = forall.body()
    subst = list(reversed([
        z3.Const(
            forall.var_name(n), forall.var_sort(n)
        ) for n in range(0, forall.num_vars())
    ]))

    implication = z3.substitute_vars(implication, * subst)

    write_implication_smt2(implication, pref + '  ', None, writer)

    writer.write("\n{})".format(pref))

def print_selectors(s, writer):
    assert s.arity() == 1
    writer.write("({} {})".format(s, s.range().sexpr()))

def print_constructor(dt, i, writer):
    c = dt.constructor(i)
    writer.write("({} ".format(c))
    n = c.arity()
    for j in range(n):
        s = dt.accessor(i, j)
        writer.write(" ")
        print_selectors(s, writer)
    writer.write(")")

def write_dt_decl(grp, writer):
    writer.write('(declare-datatypes (')
    indent = 20
    first = True
    for dt in grp:
        if (not first):
            writer.write(" ")
            indent = indent + 1
        first = False
        writer.write('({} 0)'.format(dt))
        indent = indent + len(str(dt)) + 4
    writer.write(') (')
    indent = indent + 3
    lnIter = 0
    sz = len(grp)
    for dt in grp:
        writer.write('(')
        n = dt.num_constructors()
        first = True
        for i in range(n):
            if (not first):
                writer.write(" ")
            first = False
            print_constructor(dt, i, writer)
        writer.write(')')
        if not lnIter == sz - 1:
            writer.write('\n')
            writer.write(' ' * indent)
        lnIter = lnIter + 1
    writer.write('))')

# get all datatypes used at the top level in the definition of dt
def get_all_top_level_deps(dt):
    if not isinstance(dt, z3.DatatypeSortRef):
        return set()
    deps = {dt}
    n = dt.num_constructors()
    for i in range(n):
        c = dt.constructor(i)
        m = c.arity()
        for j in range(m):
            s = c.domain(j)
            if isinstance(s, z3.DatatypeSortRef):
                if s in deps:
                    continue
                deps.add(s)
                deps_new = get_all_top_level_deps(s)
                deps.update(deps_new)
    return deps


def group_and_print_dt(dt_declarations, writer, seen):
    for dt in dt_declarations:
        if dt in seen:
            continue
        shallow_deps = get_all_top_level_deps(dt)
        all_deps = get_all_deps(dt)
        deep_deps = all_deps - shallow_deps
        group_and_print_dt(deep_deps, writer, seen)
        grp = []
        for d in shallow_deps:
            if not d in seen:
                grp.append(d)
                seen.add(d)
        write_dt_decl(grp, writer)
        writer.write('\n')

def write_clauses_smt2(dt_declarations, pred_declarations, clauses, writer):
    writer.write('(set-logic HORN)\n\n')
    group_and_print_dt(dt_declarations, writer, set())
    writer.write('\n')
    for decl in pred_declarations:
        write_pred_decl(decl, writer)
        writer.write('\n')
    writer.write('\n')
    for clause in clauses:
        writer.write('(assert\n')
        write_clause_smt2(clause, '  ', writer)
        writer.write('\n)\n')
    writer.write('\n')
    writer.write('(check-sat)\n')
    writer.write('(exit)\n')


def write_clauses_datalog(declarations, clauses, writer):
    reserved_exit_point = 'reserved_exit_point'
    writer.write(
        '(declare-rel {} ())\n\n'.format(reserved_exit_point)
    )

    for decl in declarations:
        symbol = quote_symbol_if_needed(decl.name())
        writer.write(
            '(declare-rel {} ('.format(symbol)
        )
        for n in range(0, decl.arity()):
            writer.write((" {}".format(decl.domain(n))))
        writer.write(' ))\n')

    known_vars = set([])
    implications = []
    writer.write('\n')

    for clause in clauses:
        if not (z3.is_quantifier(clause) and clause.is_forall()):
            raise Exception(
                "Illegal clause for write_clause_smt2: {}".format(
                    clause.decl()
                )
            )

        for idx in range(0, clause.num_vars()):
            if (clause.var_name(idx), clause.var_sort(idx)) not in known_vars:
                known_vars.add(
                    (clause.var_name(idx), clause.var_sort(idx))
                )
                writer.write(
                    "(declare-var {} {})\n".format(
                        clause.var_name(idx), clause.var_sort(idx).sexpr()
                    )
                )

        implication = clause.body()
        subst = list(reversed([
            z3.Const(
                clause.var_name(n), clause.var_sort(n)
            ) for n in range(0, clause.num_vars())
        ]))

        implications.append(
            z3.substitute_vars(implication, * subst)
        )

    writer.write('\n')

    for implication in implications:
        writer.write('(rule\n')
        write_implication_smt2(implication, '  ', reserved_exit_point, writer)
        writer.write('\n)\n')

    writer.write(
        '\n\n(query {})\n\n'.format(reserved_exit_point)
    )


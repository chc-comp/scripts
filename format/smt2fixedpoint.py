#!/usr/bin/env python

import z3
import sys
import os

sys.setrecursionlimit(100000)

def register(f, ast, registered):
    if ast.get_id() in registered:
        return
    registered.append(ast.get_id())
    for i in ast.children():
        if z3.is_app(i) and i.decl().kind()==z3.Z3_OP_UNINTERPRETED:
            f.register_relation(i.decl())
        else:
            register(f, i, registered)

def foreach_expr (fn, expr, *args, **kwargs):
    _foreach_expr(fn, expr, z3.AstMap(), *args, **kwargs)

def _foreach_expr (fn, expr, visited, *args, **kwargs):
    if expr in visited:
        return

    visited[expr] = expr

    fn(expr, *args, **kwargs)

    for k in expr.children():
        _foreach_expr(fn, k, visited, *args, **kwargs)

def find_vars (ast):
    vars = list()
    def add(expr):
        if z3.is_var(expr):
            vars.append(expr)

    foreach_expr(add, ast)

    return sorted(vars, lambda x, y: z3.get_var_index(x) - z3.get_var_index(y))

def abstractForAll(ast):
    """Universally quantifies all bound variables in the input ast"""
    subs=[]
    vs=[]
    for i, var in enumerate(find_vars(ast)):
        const = z3.Const('c!!'+str(i), var.sort())
        subs.append((var, const))
        vs.append(const)
    r = z3.substitute(ast, *subs)
    if len(vs) > 0:
        r = z3.ForAll(vs, r)
    return r

def transform_assertion(assertion, error):
        if z3.is_quantifier(assertion):  # forall
            while  z3.is_quantifier(assertion):
                assert(assertion.is_forall())
                assertion = assertion.children()[0]
        elif z3.is_not(assertion):  # not exists
            exists = assertion.children()[0]
            assert(z3.is_quantifier(exists) and not exists.is_forall())
            assertion = z3.Not(exists.children()[0]) # -> forall not

        if z3.is_true(assertion):
            return None

        if assertion.decl().kind() == z3.Z3_OP_UNINTERPRETED:
            rule = assertion
        else:
            if assertion.decl().kind() == z3.Z3_OP_IMPLIES:
                body, head = assertion.children()
            elif z3.is_or(assertion):  # (or (not a1) ... (not an) b)
                kids = assertion.children()
                head = kids[-1]
                body=z3.And(*[z3.Not(i) for i in kids[:-1]])
            elif(z3.is_not(assertion)):  # (not a)
                head = error
                body = assertion.children()[0]
            else:
                raise ValueError()
            if z3.is_app(head) and head.decl().kind() != z3.Z3_OP_UNINTERPRETED:
                body = z3.And(body, z3.Not(head))
                head = error
            rule = z3.Implies(body, head)
        return abstractForAll(rule)

def translate(path, output_path):
    ast=z3.parse_smt2_file(path)
    c=z3.Context()
    f=z3.Fixedpoint()
    error = z3.Bool('error!!0')
    f.register_relation(error.decl())
    registered = []

    for assertion in ast.children():
        register(f, assertion, registered)
        rule = transform_assertion(assertion, error)
        # skip rules witht true head
        if rule is None:
            continue
        f.add_rule(rule)


    fstr=f.to_string([error])
    fstr=fstr[fstr.find('(declare-rel'):]
    open(output_path,'w').write(fstr)


for path in sys.argv[1:]:
    smt=open(path).read()
    output_path='/'.join(path.split('/')[:-1])+'/fp_'+path.split('/')[-1]
    if os.path.exists(output_path):
        continue
    if smt.find('(query ')>0:
        continue
    print(path)
    if smt.find('(rule ')>0:
        print('   fixedpoint no query')
        continue
    try:
        translate(path, output_path)
    except ValueError as ex:
        print('   '+str(ex))
    except KeyboardInterrupt:
        pass

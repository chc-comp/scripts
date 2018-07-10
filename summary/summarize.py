from __future__ import print_function

import pandas as pd
import argparse
import sys

def solver_name(n) :
    if n == 'spacer' :
        return n
    elif n.startswith('rebus') :
        return 'rebus'
    elif n.startswith('Eldarica'):
        return 'eldarica'
    elif n.startswith('TransfHORNer'):
        return 'TransfHORNer'
    elif n.startswith('Ultimate TreeAutomizer'):
        return 'tree-aut'
    elif n.startswith('Ultimate Unihorn Automizer'):
        return 'uni-aut'
    elif n.startswith('PECOS'):
        return 'pecos'
    elif n.startswith('hoice'):
        return 'hoice'
    return n

def sat_agg(s):
    return list(s).count('sat')
def uns_agg(s):
    return list(s).count('unsat')
def fld_agg(s):
    return list(s).count('starexec-unknown')
def ok_agg(s):
    return sat_agg(s) + uns_agg(s)
def to_agg(s):
    x = s.where(s.str.startswith('timeout'))
    return x.count()
def mo_agg(s):
    x = s.where(s.str.startswith('memout'))
    return x.count()

def uniq_agg(s):
    if s.count() == 0:
        return 'none'
    elif s.count() == 1:
        return s.iloc[0]
    else:
        return 'many'
class SummaryApp(object):
    args= None
    def __init__(self):
        pass

    def parse_args(self, argv):
        ap = argparse.ArgumentParser('summarize',
                                     description = 'Summarize StarExec results')

        ap.add_argument('-o', dest='out_file', metavar='FILE',
                        help='Output file name', default='summary.csv')
        ap.add_argument('in_file', metavar='FILE', help='Input file')
        self.args = ap.parse_args(argv)

    def run(self, args):
        pd.options.display.max_columns=99
        pd.options.display.max_rows=500
        df = pd.read_csv(args.in_file)
        gp = df.groupby('solver', as_index=False)
        df2 = gp.agg({'result' : ['count', ok_agg, sat_agg, uns_agg, fld_agg],
                      'status' : [to_agg, mo_agg],
                      'cpu time' : 'sum',
                      'wallclock time' : 'sum',
                      'memory usage' : 'sum'}) \
                .rename(columns={'wallclock time' : 'wall',
                                 'cpu time' : 'time',
                                 'memory usage' : 'space',
                                 'ok_agg' : 'ok',
                                 'sat_agg' : 'sat',
                                 'uns_agg' : 'uns',
                                 'fld_agg' : 'fld',
                                 'to_agg' : 'to',
                                 'mo_agg' : 'mo',
                })

        df2.columns = [' '.join(col) for col in df2.columns]
        df2.columns = [col.strip() for col in df2.columns]
        df2.reset_index()
        df2.rename(inplace=True,
                   columns = {'result count' : 'cnt',
                              'result ok' : 'ok',
                              'result sat' : 'sat',
                              'result uns' : 'uns',
                              'result fld' : 'fld',
                              'status to' : 'to',
                              'status mo' : 'mo',
                              'time sum' : 'time',
                              'space sum' : 'space',
                              'wall sum' : 'real'
                   })
        df2.time = df2.time.astype('int64')
        df2.real = df2.real.astype('int64')
        df2.space = (df2.space / (1024 * 1024)).astype('int64')
        df2.solver = df2.solver.apply(solver_name)

        cols = ['solver', 'cnt', 'ok', 'sat', 'uns', 'fld', 'to', 'mo',
                'time', 'real', 'space']
        df2 = df2[cols]
        df2 = df2.sort_values('ok', ascending=False)


        gp2 = df[df.result.str.contains('sat')].groupby('benchmark',
                                                        as_index = False)
        df3 = gp2.agg({'solver': uniq_agg})
        df3 = df3[~df3.solver.str.match('many')]
        df3 = df3[['benchmark', 'solver']]
        df3 = df3.groupby('solver', as_index=False).agg ({'benchmark': 'count'});
        df3 = df3.rename(columns = {'benchmark' : 'uniq'})
        df3 = df3.sort_values('uniq', ascending=False)
        df3.columns = [col.strip() for col in df3.columns]
        df3.solver = df3.solver.apply(solver_name)

        df3.set_index('solver')
        df2.set_index('solver')
        df4 = pd.merge(df2, df3, how='outer', on='solver').fillna(0)
        df4.uniq = df4.uniq.astype('int32')
        df4.set_index('solver')
        print(df4)

        df4.to_csv(args.out_file, index=False)

    def main(self, argv):
        self.parse_args(argv[1:])
        self.run(self.args)

    pass

if __name__ == '__main__':
    app = SummaryApp()
    sys.exit(app.main(sys.argv))

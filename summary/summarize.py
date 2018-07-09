from __future__ import print_function

import pandas as pd
import argparse
import sys

def solver_name(n) :
    if n == 'spacer' :
        return n
    elif n == 'rebus' :
        return n
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
        df = pd.read_csv(args.in_file)
        gp = df.groupby('solver', as_index=False)
        df2 = gp.agg({'result' : ['count', ok_agg, sat_agg, uns_agg, fld_agg],
                      'cpu time' : 'sum',
                      'wallclock time' : 'sum',
                      'memory usage' : 'sum'}) \
                .rename(columns={'wallclock time' : 'wall',
                                 'cpu time' : 'time',
                                 'memory usage' : 'space',
                                 'ok_agg' : 'ok',
                                 'sat_agg' : 'sat',
                                 'uns_agg' : 'uns',
                                 'fld_agg' : 'fld'
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
                              'time sum' : 'time',
                              'space sum' : 'space',
                              'wall sum' : 'real'
                   })
        df2.time = df2.time.astype('int64')
        df2.real = df2.real.astype('int64')
        df2.space = (df2.space / (1024 * 1024)).astype('int64')
        df2.solver = df2.solver.apply(solver_name)

        cols = ['solver', 'cnt', 'ok', 'sat', 'uns', 'fld',
                'time', 'real', 'space']
        df2 = df2[cols]
        df2 = df2.sort_values('ok', ascending=False)
        print(df2)

        # solver, cnt, ok, sat, uns, fld, to, mo, real, time, space, best, uniq
        # best and uniq computed separately
        # cnt is easy
        # ok : sat + unsat group of result column
        # sat: sat group of result column
        # uns: unsat group of result column
        # fld: starexec-unknown of result column
        # to: timeout of status column
        # mo: memout of status column
        # real: sum of time
        # time: sum of wallclock
        # space: sum of space


    def main(self, argv):
        self.parse_args(argv[1:])
        self.run(self.args)

    pass

if __name__ == '__main__':
    app = SummaryApp()
    sys.exit(app.main(sys.argv))

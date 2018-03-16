#! /bin/bash

if [ -d src/z3 ] ; then
  exit 0
fi

if [ ! -d z3 ] ; then
  git clone https://github.com/Z3Prover/z3
fi

if [ ! -d z3/build ] ; then
  cd z3
  python scripts/mk_make.py --python
  cd build ; make -j 4
  cd ../..
fi

cp -r z3/build/python/libz3.* .
cp -r z3/build/python/z3 src/.
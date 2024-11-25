#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
Hello.

Usage:
  main.py <ext1> <ext2>

Options:
  -h --help     Show this screen.
"""
from docopt import docopt
arguments = docopt(__doc__)
ext1 = arguments['<ext1>']
ext2 = arguments['<ext2>']
import os
l = []
for n in os.listdir('.'):
    if n.endswith(ext1):
        n2 = n[:-len(ext1)] + ext2
        l.append((n, n2))

for n1, n2 in l:
    print('mv "%s" "%s"' % (n1, n2))

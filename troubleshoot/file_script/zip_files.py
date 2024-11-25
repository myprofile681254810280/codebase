import sys
import shlex
for src in sys.argv[1:]:
    dst = src + '.zip'
    src = shlex.quote(src)
    dst = shlex.quote(dst)
    print('zip -r %s %s' % (dst, src))

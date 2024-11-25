import glob
import os.path
import shlex
import pipes
import sys
for src in sys.argv[1:]:
    n, ext = os.path.splitext(src)
    dst = n + '.txt'
    if not os.path.exists(dst):
        src = shlex.quote(src)
        dst = shlex.quote(dst)
        cmd = 'ffmpeg -i %s -f ffmetadata %s'
        cmd = cmd % (src, dst)
        print(cmd)

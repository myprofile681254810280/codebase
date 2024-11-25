import glob
import os.path
import shlex
import pipes
import sys
for src in sys.argv[1:]:
    n, ext = os.path.splitext(src)
    dst = n + '.flac'
    meta = n + '.txt'
    if not os.path.exists(dst):
        src = shlex.quote(src)
        dst = shlex.quote(dst)
        meta = shlex.quote(meta)
        cmd = 'ffmpeg -i %s -i %s -map_metadata 1 %s'
        cmd = cmd % (src, meta, dst)
        print(cmd)

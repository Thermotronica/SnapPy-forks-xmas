import sys
from threading import Thread
from .version import version as current
from pkg_resources import parse_version
import ssl
from urllib import request
version_url = 'https://raw.githubusercontent.com/3-manifolds/SnapPy/master/current.txt'

class Phoner(Thread):
    def __init__(self):
        Thread.__init__(self)
        self.answer = None

    def run(self):
        this_version = parse_version(current)
        latest = None
        try:
            ctx = ssl.create_default_context()
            ctx.check_hostname = False
            ctx.verify_mode = ssl.CERT_NONE
            with request.urlopen(version_url, context=ctx) as response:
                latest = response.read().decode('ascii').strip()
                latest_version = parse_version(latest)
        except Exception:
            return
        if latest and latest_version > this_version:
            self.answer = (latest, current)


def update_needed():
    ET = Phoner()
    ET.start()
    ET.join(1.0)  # Wait up to 1.0 seconds for an answer
    if ET.is_alive():
        return ''
    elif ET.answer:
        return ("**Please upgrade to %s from %s via "
                "http://snappy.computop.org**\n" % ET.answer)
    else:
        return ''

if __name__ == '__main__':
    if len(sys.argv) > 1:
        this_version = '0.0.0'
    else:
        print('To provoke an update response add an argument.')
    import time
    start = time.time()
    print(update_needed())
    print('Elapsed time: %ss' % (time.time() - start))

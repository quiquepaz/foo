import SimpleHTTPServer
import SocketServer
import time


class TestServer(SocketServer.TCPServer):
    allow_reuse_address = True


class TestRequestHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):

    def do_POST(self):
        if (int(time.time()) % 2) == 0:
            time.sleep(2)
        SimpleHTTPServer.SimpleHTTPRequestHandler.do_GET(self)

    def log_message(self, format, *args):
        pass

if __name__ == '__main__':
    httpd = TestServer(('0.0.0.0', 6666), TestRequestHandler)
    httpd.serve_forever()

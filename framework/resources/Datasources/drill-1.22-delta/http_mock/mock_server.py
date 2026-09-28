#!/usr/bin/env python3
"""MD-6687 mock HTTP API for the Drill 1.22 HTTP-plugin delta tests. Stdlib only (python3.6+).

Endpoints (bind 127.0.0.1, port $MD6687_MOCK_PORT, default 18687):
  /echo/headers         -> [{"name": <lower-cased header>, "value": <v>}] for every x-md6687-* request header
  /paged/offset         -> ids [offset, offset+limit) out of 25; each row reports how often offset/limit
                           appeared in that request's query string (DRILL-8524)
  /paged/headerindex    -> 10 rows per page (?page=N), 'link' response header points at the next page (DRILL-8437)
  /csv/custom           -> ';'-delimited, "'"-quoted CSV (DRILL-8457)
"""
import json
import os
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import urlparse, parse_qs

PORT = int(os.environ.get("MD6687_MOCK_PORT", "18687"))
TOTAL = 25


class Handler(BaseHTTPRequestHandler):
    def _send(self, body, ctype="application/json", extra_headers=None):
        data = body.encode("utf-8")
        self.send_response(200)
        self.send_header("Content-Type", ctype)
        self.send_header("Content-Length", str(len(data)))
        for k, v in (extra_headers or {}).items():
            self.send_header(k, v)
        self.end_headers()
        self.wfile.write(data)

    def do_GET(self):
        url = urlparse(self.path)
        qs = parse_qs(url.query, keep_blank_values=True)

        if url.path == "/echo/headers":
            rows = [{"name": k.lower(), "value": v} for k, v in self.headers.items()
                    if k.lower().startswith("x-md6687")]
            return self._send(json.dumps(rows))

        if url.path == "/paged/offset":
            offset = int(qs.get("offset", ["0"])[0])
            limit = int(qs.get("limit", ["5"])[0])
            raw = url.query
            rows = [{"id": i, "raw_query": raw,
                     "offset_count": len(qs.get("offset", [])),
                     "limit_count": len(qs.get("limit", []))}
                    for i in range(offset, min(offset + limit, TOTAL))]
            return self._send(json.dumps(rows))

        if url.path == "/paged/headerindex":
            page = int(qs.get("page", ["0"])[0])
            start = page * 10
            rows = [{"id": i} for i in range(start, min(start + 10, TOTAL))]
            headers = {}
            if start + 10 < TOTAL:
                headers["link"] = "http://127.0.0.1:%d/paged/headerindex?page=%d" % (PORT, page + 1)
            return self._send(json.dumps(rows), extra_headers=headers)

        if url.path == "/csv/custom":
            return self._send("id;name\n1;'a;b'\n2;'c'\n", ctype="text/csv")

        self.send_response(404)
        self.end_headers()

    def log_message(self, fmt, *args):
        pass


if __name__ == "__main__":
    HTTPServer(("127.0.0.1", PORT), Handler).serve_forever()

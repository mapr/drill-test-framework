#!/bin/bash
# MD-6687 gen script: start the mock HTTP API (idempotent) and register storage plugin md6687_http.
# Runs from the repo root (TestDriver gen datasource). Exit non-zero on any failure.
set -e
DIR=framework/resources/Datasources/drill-1.22-delta
PORT=${MD6687_MOCK_PORT:-18687}

if ! curl -s --noproxy '*' -o /dev/null "http://127.0.0.1:${PORT}/echo/headers"; then
  setsid nohup python3 "$DIR/http_mock/mock_server.py" </dev/null >/tmp/md6687_mock.log 2>&1 &
  for i in $(seq 1 20); do
    curl -s --noproxy '*' -o /dev/null "http://127.0.0.1:${PORT}/echo/headers" && break
    sleep 0.5
  done
fi
curl -sf --noproxy '*' -o /dev/null "http://127.0.0.1:${PORT}/echo/headers"

sed "s/@PORT@/${PORT}/g" "$DIR/http_mock/plugin_http.json" > /tmp/md6687_plugin_http.json
bash "$DIR/drill_rest.sh" post md6687_http /tmp/md6687_plugin_http.json

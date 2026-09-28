#!/bin/bash
# MD-6687 helper: create/delete a Drill storage plugin through the REST API.
# Usage: drill_rest.sh post <plugin-name> <json-file> | drill_rest.sh delete <plugin-name>
# Reads server/port/https/credentials from conf/drillTestConfig.properties (run from the repo root).
set -e
source conf/drillTestConfig.properties

PROTO=http
[ "$HTTPS_ENABLED" == "true" ] && PROTO=https
BASE="$PROTO://${DRILL_STORAGE_PLUGIN_SERVER}:${DRILL_STORAGE_PLUGIN_SERVER_PORT:-8047}"
JAR=$(mktemp)
trap 'rm -f "$JAR"' EXIT

# Form login (no-op when Web UI auth is off: j_security_check just redirects)
curl -sk --noproxy '*' -c "$JAR" -b "$JAR" -o /dev/null -d "j_username=${USERNAME}" -d "j_password=${PASSWORD}" \
  "$BASE/j_security_check" || true

case "$1" in
  post)
    code=$(curl -sk --noproxy '*' -b "$JAR" -o /tmp/md6687_rest_$$.out -w '%{http_code}' -X POST \
      -H 'Content-Type: application/json' --data-binary @"$3" "$BASE/storage/$2.json")
    ;;
  delete)
    code=$(curl -sk --noproxy '*' -b "$JAR" -o /tmp/md6687_rest_$$.out -w '%{http_code}' -X DELETE "$BASE/storage/$2.json")
    ;;
  *) echo "usage: $0 post <name> <json> | delete <name>"; exit 2 ;;
esac
body=$(cat /tmp/md6687_rest_$$.out); rm -f /tmp/md6687_rest_$$.out
echo "$1 $2 -> HTTP $code $body"
[[ "$code" =~ ^2 ]] && ! grep -qi '"result" *: *"error' <<<"$body"

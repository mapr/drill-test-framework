#!/bin/bash
# MD-6687 gen script: register storage plugin md6687_sftp (dfs-type, sftp://<drillbit host>).
# Needs the one-time root step sftp/setup_sftp_user.sh. Runs from the repo root.
set -e
DIR=framework/resources/Datasources/drill-1.22-delta
PWFILE="$DIR/sftp/.sftp_test_password"
[ -s "$PWFILE" ] || { echo "missing $PWFILE - run sftp/setup_sftp_user.sh as root first"; exit 1; }
source conf/drillTestConfig.properties

umask 077
python3 - "$PWFILE" "$DRILL_STORAGE_PLUGIN_SERVER" > /tmp/md6687_plugin_sftp.json <<'EOF'
import json, sys
pw = open(sys.argv[1]).read().strip()
host = sys.argv[2]
print(json.dumps({"name": "md6687_sftp", "config": {
    "type": "file", "enabled": True,
    "connection": "sftp://%s:22/" % host,
    "workspaces": {"root": {"location": "/home/md6687sftp/data", "writable": False, "defaultInputFormat": None}},
    "formats": {"csvh": {"type": "text", "extensions": ["csvh"], "extractHeader": True, "fieldDelimiter": ","}},
    "credentialsProvider": {"credentialsProviderType": "PlainCredentialsProvider",
                            "credentials": {"username": "md6687sftp", "password": pw}},
    "authMode": "SHARED_USER"}}))
EOF
bash "$DIR/drill_rest.sh" post md6687_sftp /tmp/md6687_plugin_sftp.json
rm -f /tmp/md6687_plugin_sftp.json

#!/bin/bash
# MD-6687: remove the delta-suite storage plugins and stop the mock server, so later suites
# (information_schema, show schemas) never see them. Run from the repo root after the delta group.
DIR=framework/resources/Datasources/drill-1.22-delta
bash "$DIR/drill_rest.sh" delete md6687_http || true
bash "$DIR/drill_rest.sh" delete md6687_sftp || true
pkill -f "[m]ock_server.py" || true
exit 0

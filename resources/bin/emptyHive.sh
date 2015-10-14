#!/bin/sh

# The below command causes the shell to exit immediately if any command fails
set -e

hive -e 'use is; show tables'|xargs -I '{}' hive -e 'use is; drop table {}'
hive -e 'use marketing; show tables'|xargs -I '{}' hive -e 'use marketing; drop table {}'

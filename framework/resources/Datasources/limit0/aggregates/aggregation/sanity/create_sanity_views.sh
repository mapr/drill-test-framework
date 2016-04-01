#!/bin/sh

${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.aggregation;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=r${DRILL_TEST_DATA_DIR}/Datasources/limit0/aggregates/aggregation/sanity/create_sanity_views.sql

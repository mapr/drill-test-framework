source ~/.drillTestConfig
$DRILL_HOME/bin/sqlline -n mapr -p mapr -u "jdbc:drill:drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" -f resources/Datasources/impersonation/dfs/noaccessnestedviews.sql

${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.$1;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=resources/Datasources/metadata_caching/refresh_metadata_deletecache.ddl
hadoop fs -test /drill/testdata/metadata_caching/lineitem_deletecache/.drill.parquet_metadata
cacheExists=$?

if [ $cacheExists -eq 0 ]; then
  hadoop fs -rm /drill/testdata/metadata_caching/lineitem_deletecache/.drill.parquet_metadata
fi

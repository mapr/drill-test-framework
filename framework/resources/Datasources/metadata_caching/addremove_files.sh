hadoop fs -test -d /drill/testdata/metadata_caching/lineitem_addfiles
addfilesExists=$?
hadoop fs -test -d /drill/testdata/metadata_caching/lineitem_addfiles
removefilesExists=$?
hadoop fs -test -d /drill/testdata/metadata_caching/lineitem_adddir
addDirExists=$?
hadoop fs -test -d /drill/testdata/metadata_caching/lineitem_removedir
removeDirExists=$?
hadoop fs -test -d /drill/testdata/metadata_caching/lineitem_addautopartitioned_files
addAutoPartitionExists=$?
hadoop fs -test -d /drill/testdata/metadata_caching/lineitem_removeautopartitioned_files
removeAutoPartitionExists=$?

if [ $addfilesExists -eq 0 ]; then 
  hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_addfiles
fi
if [ $removefilesExists -eq 0 ]; then
  hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_removefiles
fi
if [ $addDirExists -eq 0 ]; then
  hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_adddir
fi
if [ $removeDirExists -eq 0 ]; then
  hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_removedir
fi
if [ addAutoPartitionExists= -eq 0 ]; then
  hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_addautopartitioned_files
fi
if [ $removeAutoPartitionExists -eq 0 ]; then
  hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_removeautopartitioned_files
fi




hadoop fs -copyFromLocal resources/Datasources/metadata_caching/data/lineitem_addfiles /drill/testdata/metadata_caching/
hadoop fs -copyFromLocal resources/Datasources/metadata_caching/data/lineitem_removefiles /drill/testdata/metadata_caching/
hadoop fs -copyFromLocal resources/Datasources/metadata_caching/data/lineitem_adddir /drill/testdata/metadata_caching/
hadoop fs -copyFromLocal resources/Datasources/metadata_caching/data/lineitem_removedir /drill/testdata/metadata_caching/
hadoop fs -copyFromLocal resources/Datasources/metadata_caching/data/lineitem_addautopartitioned_files /drill/testdata/metadata_caching/
hadoop fs -copyFromLocal resources/Datasources/metadata_caching/data/lineitem_removeautopartitioned_files /drill/testdata/metadata_caching/


resources/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/lineitem_addfiles
resources/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/lineitem_removefiles
resources/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/lineitem_adddir
resources/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/lineitem_removedir
resources/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/lineitem_addautopartitioned_files
resources/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/lineitem_removeautopartitioned_files
resources/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/orders

${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.$1;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=resources/Datasources/metadata_caching/refresh_metadata_addremovefiles.ddl

hadoop fs -copyFromLocal resources/Datasources/metadata_caching/data/lineitem1.parquet /drill/testdata/metadata_caching/lineitem_addfiles/lineitem1.parquet
hadoop fs -rm /drill/testdata/metadata_caching/lineitem_removefiles/lineitem1.parquet
hadoop fs -copyFromLocal resources/Datasources/metadata_caching/data/feb /drill/testdata/metadata_caching/lineitem_adddir/
hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_removedir/feb
hadoop fs -copyFromLocal resources/Datasources/metadata_caching/data/lineitem2.parquet /drill/testdata/metadata_caching/lineitem_addautopartitioned_files/
hadoop fs -rm /drill/testdata/metadata_caching/lineitem_removeautopartitioned_files/lineitem2.parquet

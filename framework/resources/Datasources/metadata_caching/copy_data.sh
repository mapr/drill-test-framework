source ~/.drillTestConfig
if ! $(hadoop fs -test -d /drill/testdata/metadata_caching); 
then 
  hadoop fs -copyFromLocal resources/Datasources/metadata_caching/data /drill/testdata/metadata_caching
fi

#user=`ps -ef | grep Drillbit | grep -v grep | awk '{print $1}'`

user=`ssh $DRILL_STORAGE_PLUGIN_SERVER ps -ef | grep Drillbit | grep -v grep | awk '{print $1}'`
hadoop fs -chown -R `echo $user`: /drill/testdata/metadata_caching

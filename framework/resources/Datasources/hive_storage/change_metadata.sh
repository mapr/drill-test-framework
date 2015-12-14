set -x
resources/bin/execHive.sh resources/Datasources/hive_storage/change_metadata1.ddl
${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.ctasAutoPartition;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=resources/Datasources/hive_storage/change_metadata_drill.sql

resources/bin/execHive.sh resources/Datasources/hive_storage/change_metadata2.ddl
sleep 60;

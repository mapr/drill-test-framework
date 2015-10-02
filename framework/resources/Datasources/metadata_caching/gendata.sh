#!/bin/sh

hadoop fs -mkdir -p /drill/testdata/tpch100_$1files
var=5150000
mul=`expr $1 / 5000`
echo $mul
size=`expr $var / $mul`
echo $size
#sed "s/$var/$size/g" "gendata.ddl" > gendata.ddl_temp && mv gendata.ddl_temp gendata.ddl
${DRILL_HOME}/bin/sqlline -n user1 -p mapr -u "jdbc:drill:schema=dfs.tpch100_$1files;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=gendata.ddl
#sed "s/$size/$var/g" "gendata.ddl" > gendata.ddl_temp && mv gendata.ddl_temp gendata.ddl

# TODO: it seems that sqlline does not exit, if one of the queries failed.
if [ "$?" -eq 0 ]
then
        exit 0
else
        echo "ERROR: create table script failed. Rerun create_tables_parquet.ddl to debug failures."
        exit 1
fi

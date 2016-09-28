#!/bin/bash

sf=$1

echo "exists '/drill/testdata/tpch_sf$sf/maprdb/json/customer'" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create '/drill/testdata/tpch_sf$sf/maprdb/json/customer'" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpch_sf$sf/maprdb/json/importFiles/customer -dst /drill/testdata/tpch_sf$sf/maprdb/json/customer -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpch_sf$sf/maprdb/json/customer -cfname default -readperm "u:root | u:mapr"
fi

echo "exists '/drill/testdata/tpch_sf$sf/maprdb/json/lineitem'" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
        echo "create '/drill/testdata/tpch_sf$sf/maprdb/json/lineitem'" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpch_sf$sf/maprdb/json/importFiles/lineitem -dst /drill/testdata/tpch_sf$sf/maprdb/json/lineitem -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpch_sf$sf/maprdb/json/lineitem -cfname default -readperm "u:root | u:mapr"
fi

echo "exists '/drill/testdata/tpch_sf$sf/maprdb/json/orders'" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
        echo "create '/drill/testdata/tpch_sf$sf/maprdb/json/orders'" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpch_sf$sf/maprdb/json/importFiles/orders -dst /drill/testdata/tpch_sf$sf/maprdb/json/orders -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpch_sf$sf/maprdb/json/orders -cfname default -readperm "u:root | u:mapr"
fi

echo "exists '/drill/testdata/tpch_sf$sf/maprdb/json/part'" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
        echo "create '/drill/testdata/tpch_sf$sf/maprdb/json/part'" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpch_sf$sf/maprdb/json/importFiles/part -dst /drill/testdata/tpch_sf$sf/maprdb/json/part -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpch_sf$sf/maprdb/json/part -cfname default -readperm "u:root | u:mapr"
fi

echo "exists '/drill/testdata/tpch_sf$sf/maprdb/json/partsupp'" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
        echo "create '/drill/testdata/tpch_sf$sf/maprdb/json/partsupp'" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpch_sf$sf/maprdb/json/importFiles/partsupp -dst /drill/testdata/tpch_sf$sf/maprdb/json/partsupp -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpch_sf$sf/maprdb/json/partsupp -cfname default -readperm "u:root | u:mapr"
fi

echo "exists '/drill/testdata/tpch_sf$sf/maprdb/json/region'" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
        echo "create '/drill/testdata/tpch_sf$sf/maprdb/json/region'" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpch_sf$sf/maprdb/json/importFiles/region -dst /drill/testdata/tpch_sf$sf/maprdb/json/region -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpch_sf$sf/maprdb/json/region -cfname default -readperm "u:root | u:mapr"
fi

echo "exists '/drill/testdata/tpch_sf$sf/maprdb/json/supplier'" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
        echo "create '/drill/testdata/tpch_sf$sf/maprdb/json/supplier'" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpch_sf$sf/maprdb/json/importFiles/supplier -dst /drill/testdata/tpch_sf$sf/maprdb/json/supplier -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpch_sf$sf/maprdb/json/supplier -cfname default -readperm "u:root | u:mapr"
fi

echo "exists '/drill/testdata/tpch_sf$sf/maprdb/json/nation'" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
        echo "create '/drill/testdata/tpch_sf$sf/maprdb/json/nation'" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpch_sf$sf/maprdb/json/importFiles/nation -dst /drill/testdata/tpch_sf$sf/maprdb/json/nation -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpch_sf$sf/maprdb/json/nation -cfname default -readperm "u:root | u:mapr"
fi

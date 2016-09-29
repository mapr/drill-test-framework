#!/bin/bash

sf=$1

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/customer" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/customer" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/customer -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer_address -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer_demographics -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/household_demographics -dst /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/item" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/item" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/item -dst /drill/testdata/tpcds_sf$sf/maprdb/json/item -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/item -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/promotion" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/promotion" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/promotion -dst /drill/testdata/tpcds_sf$sf/maprdb/json/promotion -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/promotion -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/time_dim -dst /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/date_dim -dst /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/store" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/store" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/store -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/warehouse -dst /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/ship_mode -dst /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/reason" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/reason" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/reason -dst /drill/testdata/tpcds_sf$sf/maprdb/json/reason -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/reason -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/income_band" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/income_band" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/income_band -dst /drill/testdata/tpcds_sf$sf/maprdb/json/income_band -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/income_band -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/call_center" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/call_center" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/call_center -dst /drill/testdata/tpcds_sf$sf/maprdb/json/call_center -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/call_center -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/web_site" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/web_site" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_site -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_site -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/web_site -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/web_page" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/web_page" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_page -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_page -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/web_page -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_page -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/inventory" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/inventory" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/inventory -dst /drill/testdata/tpcds_sf$sf/maprdb/json/inventory -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/inventory -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales -cfname default -readperm "u:root | u:mapr"
fi

echo "exists /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales -cfname default -readperm "u:root | u:mapr"
fi

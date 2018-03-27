#!/bin/bash

set -x

source conf/drillTestConfig.properties

sf=$1

if [ -n $USERNAME ]
then
    user=$USERNAME
else
    user=`ps -aef | grep Drillbit | grep org.apache.drill | cut -d' ' -f1 | head -1`
fi

hadoop fs -mkdir -p /drill/testdata/tpcds_sf$sf/maprdb/json

/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/customer
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/item
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/promotion
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/store
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/reason
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/income_band
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/call_center
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/web_site
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/web_page
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/inventory
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales
/usr/bin/mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales

if [ "$user" == "root" ]
then
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/customer
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/item
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/promotion
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/store
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/reason
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/income_band
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/call_center
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_site
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_page
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/inventory
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales
  /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales
else
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/customer
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/item
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/promotion
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/store
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/reason
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/income_band
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/call_center
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_site
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_page
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/inventory
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales
  su $user /usr/bin/mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales
fi

if [ "$user" == "root" ]
then
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer_address -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer_demographics -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/household_demographics -dst /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/item -dst /drill/testdata/tpcds_sf$sf/maprdb/json/item -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/promotion -dst /drill/testdata/tpcds_sf$sf/maprdb/json/promotion -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/time_dim -dst /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/date_dim -dst /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/warehouse -dst /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/ship_mode -dst /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/reason -dst /drill/testdata/tpcds_sf$sf/maprdb/json/reason -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/income_band -dst /drill/testdata/tpcds_sf$sf/maprdb/json/income_band -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/call_center -dst /drill/testdata/tpcds_sf$sf/maprdb/json/call_center -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_site -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_site -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_page -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_page -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_page -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/inventory -dst /drill/testdata/tpcds_sf$sf/maprdb/json/inventory -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales -bulkload false > /dev/null 2>&1
  /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales -bulkload false > /dev/null 2>&1
else
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer_address -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer_demographics -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/household_demographics -dst /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/item -dst /drill/testdata/tpcds_sf$sf/maprdb/json/item -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/promotion -dst /drill/testdata/tpcds_sf$sf/maprdb/json/promotion -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/time_dim -dst /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/date_dim -dst /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/warehouse -dst /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/ship_mode -dst /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/reason -dst /drill/testdata/tpcds_sf$sf/maprdb/json/reason -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/income_band -dst /drill/testdata/tpcds_sf$sf/maprdb/json/income_band -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/call_center -dst /drill/testdata/tpcds_sf$sf/maprdb/json/call_center -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_site -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_site -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_page -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_page -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_page -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/inventory -dst /drill/testdata/tpcds_sf$sf/maprdb/json/inventory -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales -bulkload false > /dev/null 2>&1
  su $user /usr/bin/mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales -bulkload false > /dev/null 2>&1
fi

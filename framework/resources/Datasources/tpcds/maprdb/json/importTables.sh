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

mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/customer
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/item
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/promotion
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/store
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/reason
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/income_band
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/call_center
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/web_site
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/web_page
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/inventory
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales
mapr dbshell drop /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales

if [ "$user" == "root" ]
then
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/customer
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/item
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/promotion
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/store
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/reason
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/income_band
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/call_center
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_site
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_page
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/inventory
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales
  mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales
else
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/customer
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/item
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/promotion
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/store
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/reason
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/income_band
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/call_center
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_site
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_page
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/inventory
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales
  sudo -u $user mapr dbshell create /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales
fi

if [ "$user" == "root" ]
then
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer_address -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer_demographics -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/household_demographics -dst /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/item -dst /drill/testdata/tpcds_sf$sf/maprdb/json/item -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/promotion -dst /drill/testdata/tpcds_sf$sf/maprdb/json/promotion -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/time_dim -dst /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/date_dim -dst /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/warehouse -dst /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/ship_mode -dst /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/reason -dst /drill/testdata/tpcds_sf$sf/maprdb/json/reason -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/income_band -dst /drill/testdata/tpcds_sf$sf/maprdb/json/income_band -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/call_center -dst /drill/testdata/tpcds_sf$sf/maprdb/json/call_center -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_site -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_site -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_page -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_page -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_page -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/inventory -dst /drill/testdata/tpcds_sf$sf/maprdb/json/inventory -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales -bulkload false > /dev/null 2>&1
  mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales -bulkload false > /dev/null 2>&1
else
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer_address -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer_address -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/customer_demographics -dst /drill/testdata/tpcds_sf$sf/maprdb/json/customer_demographics -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/household_demographics -dst /drill/testdata/tpcds_sf$sf/maprdb/json/household_demographics -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/item -dst /drill/testdata/tpcds_sf$sf/maprdb/json/item -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/promotion -dst /drill/testdata/tpcds_sf$sf/maprdb/json/promotion -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/time_dim -dst /drill/testdata/tpcds_sf$sf/maprdb/json/time_dim -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/date_dim -dst /drill/testdata/tpcds_sf$sf/maprdb/json/date_dim -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store_sales -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/warehouse -dst /drill/testdata/tpcds_sf$sf/maprdb/json/warehouse -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/ship_mode -dst /drill/testdata/tpcds_sf$sf/maprdb/json/ship_mode -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/reason -dst /drill/testdata/tpcds_sf$sf/maprdb/json/reason -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/income_band -dst /drill/testdata/tpcds_sf$sf/maprdb/json/income_band -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/call_center -dst /drill/testdata/tpcds_sf$sf/maprdb/json/call_center -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_site -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_site -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/store_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/store_returns -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_page -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_page -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_page -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_page -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/inventory -dst /drill/testdata/tpcds_sf$sf/maprdb/json/inventory -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_returns -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_returns -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_returns -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/web_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/web_sales -bulkload false > /dev/null 2>&1
  sudo -u $user mapr importtable -src /drill/testdata/tpcds_sf$sf/maprdb/json/importFiles/catalog_sales -dst /drill/testdata/tpcds_sf$sf/maprdb/json/catalog_sales -bulkload false > /dev/null 2>&1
fi

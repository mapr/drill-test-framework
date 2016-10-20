#!/bin/bash

set -x 

echo "exists '/drill/testdata/yelp/maprdb/json/user'" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	hadoop fs -mkdir -p /drill/testdata/yelp/maprdb/json
	echo "create '/drill/testdata/yelp/maprdb/json/user'" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/yelp/maprdb/json/importFiles/user -dst /drill/testdata/yelp/maprdb/json/user -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/yelp/maprdb/json/user -cfname default -readperm "u:root | u:mapr"
fi

echo "exists '/drill/testdata/yelp/maprdb/json/business'" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	hadoop fs -mkdir -p /drill/testdata/yelp/maprdb/json
        echo "create '/drill/testdata/yelp/maprdb/json/business'" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/yelp/maprdb/json/importFiles/business -dst /drill/testdata/yelp/maprdb/json/business -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/yelp/maprdb/json/business -cfname default -readperm "u:root | u:mapr"
fi

echo "exists '/drill/testdata/yelp/maprdb/json/review'" | mapr dbshell | grep -i false > /dev/null 2>&1
if [ $? -eq 0 ]
then
	hadoop fs -mkdir -p /drill/testdata/yelp/maprdb/json
        echo "create '/drill/testdata/yelp/maprdb/json/review'" | mapr dbshell > /dev/null 2>&1
	mapr importtable -src /drill/testdata/yelp/maprdb/json/importFiles/review -dst /drill/testdata/yelp/maprdb/json/review -bulkload false > /dev/null 2>&1
	maprcli table cf edit -path /drill/testdata/yelp/maprdb/json/review -cfname default -readperm "u:root | u:mapr"
fi

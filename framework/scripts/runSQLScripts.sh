#!/bin/bash

set -x

optionsFile=$1

if [[ $optionsFile == "NULL" ]]
then
  echo "No sql file to execute";
else
  $DRILL_HOME/bin/sqlline -u "jdbc:drill:drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" -f $optionsFile
fi

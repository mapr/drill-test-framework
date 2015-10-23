#!/bin/bash

optionsFile=$1

if [[ $optionsFile == "NULL" ]]
then
  echo "No sql file to execute";
else
  $DRILL_HOME/bin/sqlline -u "jdbc:drill:drillbit=$2" -f $optionsFile
fi

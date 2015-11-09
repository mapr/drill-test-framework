#!/bin/bash

if [ ! -f ~/.drillTestConfig ]
then
	printf "This script uses env variables configured in ~/.drillTestConfig. Please check if the file exists\n"
	exit
fi

source ~/.drillTestConfig

if [ -z $1 ]
then
	printf "Usage:\nrunSQLScripts.sh <Path to SQL Script>\n"
	exit
fi

optionsFile=$1

$DRILL_HOME/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" -f $optionsFile

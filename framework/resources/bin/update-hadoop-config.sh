#!/bin/bash

#**************PRE-REQUISITES
#DRILL_HOME should be set


# The below command causes the shell to exit immediately if any command fails
set -e

usage()
{
    echo >&2 $1
    cat  << EOF
    $0 <config-file-location> 
EOF
    exit 1
}


get_path() {
    echo `find /opt/mapr/$1 -maxdepth 1 -type d -regex ".*/$1\-0.*"`
}


get_version() {
    PATH=$(get_path $1)
    echo "${PATH#*$1-}"
}

##
## MAIN
##
if [ $# = 0 ]; then
    usage "No arguements given"
fi

sourcePath=$1


HADOOP_PATH=$(get_path hadoop)

# run the drillTestConfig.properties file as a shell script
# drillTestConfig.properties file should have execute permissions
. src/main/resources/drillTestConfig.properties


IFS=',' read -ra ADDR <<< "$DRILLBITS"
for i in "${ADDR[@]}"; do
    echo "Copying the hadoop config file to $i"
    scp $sourcePath "root@$i:$HADOOP_PATH/conf/core-site.xml" 
done

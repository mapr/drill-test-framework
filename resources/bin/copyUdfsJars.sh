#!/bin/bash
. ~/.drillTestConfig

IFS=',' read -ra ADDR <<< "$DRILLBITS"
for i in "${ADDR[@]}"; do
  scp -r resources/Datasources/udfs/drill-udfs-1.0-SNAPSHOT* $i:$DRILL_HOME/jars/3rdparty
done    


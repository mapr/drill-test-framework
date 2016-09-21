#!/bin/bash
source conf/drillTestConfig.properties

#droptable1.q
${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.$1;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/droptable/droptable1.ddl

#droptableif1.q
${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.$1;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/droptable/droptableif1.ddl

#droptable10.q
hive -f ${DRILL_TEST_DATA_DIR}/Datasources/droptable/droptable10.ddl

#droptableif10.q
hive -f ${DRILL_TEST_DATA_DIR}/Datasources/droptable/droptableif10.ddl

#droptable13.q
hive -f ${DRILL_TEST_DATA_DIR}/Datasources/droptable/droptable13.ddl

#droptableif13.q
hive -f ${DRILL_TEST_DATA_DIR}/Datasources/droptable/droptableif13.ddl

#droptable23.q
hadoop fs -rm -r ${DRILL_TESTDATA}/droptable/droptable23
hadoop fs -mkdir ${DRILL_TESTDATA}/droptable/droptable23

#droptableif23.q
hadoop fs -rm -r ${DRILL_TESTDATA}/droptable/droptableif23
hadoop fs -mkdir ${DRILL_TESTDATA}/droptable/droptableif23

#droptable32.q
${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.$1;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/droptable/droptable32.ddl

#droptableif32.q
${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.$1;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/droptable/droptableif32.ddl

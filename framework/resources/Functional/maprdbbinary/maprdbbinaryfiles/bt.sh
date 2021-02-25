source conf/drillTestConfig.properties

cd ${DRILL_TEST_DATA_DIR}/Functional/maprdbbinary/maprdbbinaryfiles
./execScriptOnPod.sh admincli-0 btadmincli.sh

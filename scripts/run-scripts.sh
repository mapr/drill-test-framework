#!/bin/bash

#-----------NON-FRAMEWORK-TESTS-------------

#------------PREPARE-TESTS-----------------
source ../conf/drillTestConfig.properties

export RESULT_FILE=results/result.log
export FAILS_FILE=logs/fails.log
export DRILLBITS

rm -rf $RESULT_FILE
rm -rf $FAILS_FILE

IFS=',' read -ra ADDR <<< "$DRILLBITS"

export numDrills=${#ADDR[@]}

if rpm -qa | grep -q mapr-drill; then
  export UDF_USER=mapr
else
  export UDF_USER=root
fi

hadoop fs -test -d /user/$UDF_USER/drill/udf/staging
if [ $? != 0 ];
    then hadoop fs -mkdir /user/$UDF_USER/drill/udf/staging;
fi

hadoop fs -test -d /user/$UDF_USER/drill/udf/registry
if [ $? != 0 ];
    then hadoop fs -mkdir /user/$UDF_USER/drill/udf/registry
fi

#------------RUNNING-TESTS-------------------

/bin/bash resources/scripts/check_drillbits.sh 
/bin/bash resources/scripts/register_with_less_drillbits.sh
/bin/bash resources/scripts/register_with_less_drillbits2.sh
/bin/bash resources/scripts/register_with_restart.sh
/bin/bash resources/scripts/register_in_past.sh
/bin/bash resources/scripts/update_logic.sh
/bin/bash resources/scripts/unregistration_regular.sh
/bin/bash resources/scripts/unregister_without_drillbit.sh
/bin/bash resources/scripts/cancel_registration.sh
/bin/bash resources/scripts/cancel_unregistration.sh
/bin/bash resources/scripts/cancel_first_run.sh
/bin/bash resources/scripts/run_after_register.sh
/bin/bash resources/scripts/run_before_register.sh
/bin/bash resources/scripts/concurrent_register.sh
/bin/bash resources/scripts/concurrent_register2.sh
/bin/bash resources/scripts/long_query.sh
/bin/bash resources/scripts/concurrent_register_many_udfs.sh
/bin/bash resources/scripts/time_for_query.sh
/bin/bash resources/scripts/time_for_registration.sh
/bin/bash resources/scripts/change_system_property_by_any_user.sh
/bin/bash resources/scripts/change_file_system.sh
/bin/bash resources/scripts/change_file_system_and_run_from_other_node.sh

#-----------------RESULTS---------------------
pass=$(grep -o 'PASS' $RESULT_FILE | wc -l)
fail=$(grep -o 'FAIL' $RESULT_FILE | wc -l)
ignore=$(grep -o 'IGNORE' $RESULT_FILE | wc -l)

echo "" | tee -a $RESULT_FILE
echo "PASSED: $pass FAILED: $fail IGNORED: $ignore" | tee -a $RESULT_FILE
if [ -f "$FAILS_FILE" ]; then
  cat $FAILS_FILE | tee -a $RESULT_FILE
fi
#------------------END------------------------

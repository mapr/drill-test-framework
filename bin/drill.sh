#!/usr/bin/env bash
source ./conf/drillTestConfig.properties
set -e

#######################################################################
# Globals definition
#######################################################################
export MAPR_MAVEN_REPO=http://repository.mapr.com/maven
#######################################################################
# Functions definition
#######################################################################


function print_usage() {
    cat <<EOM
Usage: $(basename $0) [-b|--build] [-r|--run] [-d|--debug] [-t|--test] [--download] [-s| --sanity] [-h|--help]
Options:
    --build     If specified, all required packages for tests execution will be built.
    --download  If specified, datasources will be downloaded before building
    --run       If specified, all required packages for tests execution will be built.
    --debug     Enable remote debug for tests on port 5005 (not for drill jobs)
    --test      Specifies tests, which will be run. Here, 'Functional/aggregates,Functional/joins' are directories
                  inside [framework/resources/Functional](framework/resources/Functional).
                  All directories within this parent directory are included
    --sanity    If specified,  tests will be executed.
    --help      Prints usage information.
Usage examples:
'./drill.sh --run'                                    Run all tests drill. Tests should be built before.
'./drill.sh --build'                                  Build all tests without running them.
'./drill.sh --build --run'                            Build and run all tests drill.
'./drill.sh --run --sanity'                           run sanity tests drill.
'./drill.sh --run --test Functional/aggregates'       Run only 'Functional/aggregates'. Tests should be built before.
EOM
}

#######################################################################
# Parse options
#######################################################################

buildTests=false
download=false
runTests=false
debugEnable=false
sanity=false
test=""
test_profile="Functional/aggregates,Functional/cross-sources,Functional/date_trunc,Functional/decimal_parquet,\
Functional/flatten_operators,Functional/hive_functions_nonhivedata,Functional/interpreted_partition_pruning,\
Functional/min_max_dir,Functional/orderby,Functional/table_function,Functional/tpch,Functional/amplab,\
Functional/crossjoin,Functional/datetime,Functional/drill_fragments,Functional/functions,Functional/identifiers,\
Functional/joins,Functional/misc,Functional/p1tests,Functional/schema-changes,Functional/table_stats,Functional/udfs,\
Functional/case_expr,Functional/ctas,Functional/decimal,Functional/droptable,Functional/group_by_alias,Functional/json,\
Functional/morefiles,Functional/parquet_storage,Functional/text_storage,\
Functional/complex,Functional/cttas,Functional/decimal_avro,Functional/explicit_cast,\
Functional/implicit_cast,Functional/no_result_set,Functional/semijoin,\
Functional/timestamp_functions,Functional/union_all,Functional/convert,Functional/data-shapes,\
Functional/decimal_negative,Functional/query_parser,Functional/values,Functional/tpcds,Functional/subqueries"

# TODO: unstable tests: Functional/schema_change_empty_batch, Functional/partition_pruning

OPTS=`getopt -o hbrdfqlst: --long help,build,download,run,debug,sanity,test: -n 'drill.sh' -- "$@"`
eval set -- "${OPTS}"

while true ; do
    case "$1" in
        -h|--help)  print_usage ; exit 0 ;;
        -b|--build) buildTests=true ; shift ;;
        --download) download=true ; shift ;;
        -r|--run)   runTests=true ; shift ;;
        -d|--debug) debugEnable=true ; shift ;;
        -s|--sanity) sanity=true ; shift ;;
        -t|--test)
            case "$2" in
                "") shift 2 ;;
                *) test=$2 ; shift 2 ;;
            esac ;;
        --) shift ; break ;;

        *) break ;;
    esac
done

if [[ "$buildTests" = false ]] && [[ "$runTests" == false ]]; then
  echo "At least one of the options '--build' or '--run' must be specified"
  print_usage
  exit 1
fi

export MAVEN_OPTS="-Xmx1600m"

if [ "$buildTests" = true ]; then
    echo "Building drill..."
    ./bin/build_framework
fi

if [[ "$buildTests" = true ]] && [[ "$download" = true ]]; then
    echo "Download and building drill..."
    ./bin/build_framework -Pdownload
fi

if [ "$debugEnable" = true ]; then
    extra_profile=" --debug"
fi

if [[ $test != "" ]]; then
    test_profile="$test"
fi

if [ "$sanity" = true ]; then
    ./bin/run_jdbc_sanity_tests
    exit $?;
fi

if [ "$runTests" = true ]; then
    ./bin/run_tests -g functional -t 1200 -d -n 20 -s $test_profile $extra_profile
fi
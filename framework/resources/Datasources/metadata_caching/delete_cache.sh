# number of processes to run in parallel
echo "Deleting metadata cache files under $1"
num_procs=10
i=0

#for cfile in `hadoop fs -ls -R /drill/testdata/tpch100_dir_partitioned_200000files/lineitem/2006/1/ | grep -n "parquet_metadata"`
for cfile in `hadoop fs -ls -R $1 | grep -n "parquet_metadata"`
do
  if [[ $cfile == *".drill.parquet_metadata" ]]; then
    if (( i++ >= num_procs )); then
      sleep 2
      i=0
    fi
   hadoop fs -rm $cfile &
  fi
done
wait

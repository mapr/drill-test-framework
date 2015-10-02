while read line
do
    array[ $i ]="$line"
    (( i++ ))
done < <(hadoop fs -ls /drill/testdata/tpch100_200000files/lineitem | sed '1d;s/  */ /g' | cut -d\  -f8)

echo ${array[1]}
echo "${#array[@]}"
count=1
#count=9894
for y in {2006..2015}; do
for m in {1..12}; do
  days=`date -d "$m/1 + 1 month - 1 day" "+%d"`
  for (( d=1; d<=$days; d++ )); do
    hadoop fs -mkdir -p /drill/testdata/tpch100_dir_partitioned_200000files/lineitem/$y/$m/$d
    for i in {1..57}; do
      if [ "${count}" -le "${#array[@]}" ]; then
        echo $count
        echo ${array[$count]}
        hadoop fs -cp ${array[$count]} /drill/testdata/tpch100_dir_partitioned_200000files/lineitem/$y/$m/$d/
        count=$((count + 1))
      fi
    done
    #echo "$y/$m/$d" 
done
done
done

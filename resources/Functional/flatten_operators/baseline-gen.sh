> $2
for i in $(seq 50000)
do
  cat $1 >> $2
  echo $i
done

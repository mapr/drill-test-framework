i=0;
while read line
do
    query=$line
    if [[ $query == select* ]]; then
        echo "$query" > "filter$i.q"
        echo "" > "filter$i.e_tsv"
        i=`expr $i + 1`
        now=$(date +"%T")
        echo "$i : completed at $now"
    fi
 done < filters.sql

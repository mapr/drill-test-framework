#!/bin/bash
for fname in ../partition_pruning/dfs/parquet/data/*.q
do
linecount=`wc -l $fname | awk '{print $1}'`
if [ "$linecount" -gt 1 ]; then
    echo "More than 1 line"
else
    while read line
    do
        filename="${fname##*/}"
        filenameWithoutExtension="${filename%.*}"

        ctas="_100000rows_ctas"
        tablename="dfs.ctas_flatten.\`$filenameWithoutExtension$ctas\`"
        outfile="copied/$filename"
        echo "alter session set \`drill.exec.storage.file.partition.column.label\` = 'partition_string1';" > $outfile
        echo "$line" >> $outfile
        echo "alter session set \`drill.exec.storage.file.partition.column.label\` = 'dir';" >> $outfile
    done < $fname
    echo "Only a single line"
fi
done

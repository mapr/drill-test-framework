alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select columns[0],columns[1],columns[4],columns[10],columns[13] from `existing_partition_pruning/lineitempart` where dir0=1993 and columns[0]>29600;
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

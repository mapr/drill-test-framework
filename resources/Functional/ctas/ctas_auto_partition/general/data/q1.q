alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select * from `existing_partition_pruning/lineitempart` where (dir0=1993 and columns[0] >29600) or (dir0=1994 or columns[0]>29700);
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

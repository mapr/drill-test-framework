alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
explain plan for select * from `existing_partition_pruning/lineitempart` where (dir0=1993 or dir0=1994 or (columns[0]>29700 and columns[0] < 15000 and dir0=1995));
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

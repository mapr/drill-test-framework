alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select * from `existing_partition_pruning/lineitem_hierarchical_intstring` where (dir0=1993 or dir0=1996) and ( dir1='jun' or (columns[0] > 25000 and dir0=1995));
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

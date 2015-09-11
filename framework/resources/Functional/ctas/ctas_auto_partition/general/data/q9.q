alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select * from `existing_partition_pruning/lineitem_hierarchical_intstring` where (dir0=1993 and dir1='jun') or (dir0=1997 and dir1='jan') or dir0=1991 and dir1='feb'; 
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

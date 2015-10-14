alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
explain plan for select * from `existing_partition_pruning/lineitem_hierarchical_intstring` where (dir0=1993 or dir1='jun') and (dir0=1991 or dir1='aug' or columns[0] > 5000);
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

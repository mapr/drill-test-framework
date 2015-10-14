alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select * from `existing_partition_pruning/lineitem_hierarchical_intstring` where dir0=1993 or ( dir1='jun' and (columns[0] > 25000 or columns[0] < 15000));
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select count(*) from `existing_partition_pruning/lineitem_hierarchical_intstring` where dir0=1990+1;
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

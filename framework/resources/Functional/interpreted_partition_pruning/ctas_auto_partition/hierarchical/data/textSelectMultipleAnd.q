alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select columns[0], columns[1], columns[4], columns[10], columns[13] from `existing_partition_pruning/lineitem_hierarchical_intstring` where (dir0=cast(1993 as varchar(10)) or dir1='aug') and (dir0=cast(1994+1 as varchar(10)) or dir1='dec');
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

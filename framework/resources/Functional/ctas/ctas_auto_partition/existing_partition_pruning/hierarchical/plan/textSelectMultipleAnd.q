alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
explain plan for select columns[0], columns[1], columns[4], columns[10], columns[13] from `existing_partition_pruning/lineitem_hierarchical_intstring` where (dir0=1993 or dir1='aug') and (dir0=1995 or dir1='dec');
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

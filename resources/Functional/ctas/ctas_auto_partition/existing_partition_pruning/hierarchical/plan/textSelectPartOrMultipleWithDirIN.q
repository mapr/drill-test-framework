alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
explain plan for select columns[0], columns[1], columns[4], columns[10], columns[13], dir0, dir1 from `existing_partition_pruning/lineitem_hierarchical_intstring` where (dir0 IN (1993) and dir1='oct') or (dir0 IN (1994) and dir1='may');
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

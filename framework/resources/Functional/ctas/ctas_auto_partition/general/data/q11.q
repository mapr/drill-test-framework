alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select dir0, dir1, columns from `existing_partition_pruning/lineitem_hierarchical_intstring` where (dir0=1997 and dir1<>'jan' or (columns[0] > 20000 and dir0<>1991 or dir1='jan'));
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

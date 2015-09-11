alter system set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
explain plan for select * from `existing_partition_pruning/lineitem_hierarchical_intstring` where (dir0=cast(sqrt(1993*1993) as int) and columns[0]>29600) or (dir0=cast(199.4*10 as int) and columns[0]>29700);
alter system set `drill.exec.storage.file.partition.column.label` = 'dir';

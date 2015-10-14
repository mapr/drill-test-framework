alter system set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
explain plan for select count(*) from `existing_partition_pruning/lineitem_hierarchical_intstring` where dir0=1990+1;
alter system set `drill.exec.storage.file.partition.column.label` = 'dir';

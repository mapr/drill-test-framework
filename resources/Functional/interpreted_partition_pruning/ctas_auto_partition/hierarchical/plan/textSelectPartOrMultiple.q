alter system set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
explain plan for select columns[0], columns[1], columns[4], columns[10], columns[13] from `existing_partition_pruning/lineitem_hierarchical_intstring` where (dir0=1993 and dir1=substring('oct', 1, 3)) or (dir0=cast(abs(-1994) as varchar(10)) and dir1=concat('ma', 'y'));
alter system set `drill.exec.storage.file.partition.column.label` = 'dir';

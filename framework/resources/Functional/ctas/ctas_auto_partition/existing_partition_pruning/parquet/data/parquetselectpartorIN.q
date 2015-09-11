alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select O_ORDERKEY,O_CUSTKEY,O_CLERK,O_COMMENT from `existing_partition_pruning/orders` where (dir0 IN (1993) and o_orderkey>19500) or dir0 IN (1994);
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

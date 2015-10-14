alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select O_ORDERKEY,O_CUSTKEY,O_CLERK,O_COMMENT from `existing_partition_pruning/ordersjson` where (dir0=1993 and O_TOTALPRICE>40000) or (dir0=1994 and O_TOTALPRICE>40000);
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

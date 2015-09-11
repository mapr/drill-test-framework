alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select count(*) from `existing_partition_pruning/ordersjson` where dir0=1993;
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

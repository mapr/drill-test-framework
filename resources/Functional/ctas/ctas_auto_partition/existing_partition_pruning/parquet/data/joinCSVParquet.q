alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select o.O_TOTALPRICE, l.columns[0]
   from `existing_partition_pruning/orders` o, `existing_partition_pruning/lineitem` l
   where o.O_ORDERKEY = cast(l.columns[0] as integer) and o.O_TOTALPRICE > 300000.00
   order by o.O_TOTALPRICE;
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';


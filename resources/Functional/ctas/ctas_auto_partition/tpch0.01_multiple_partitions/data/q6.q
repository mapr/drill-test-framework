alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select distinct l_modline, l_moddate from `tpch_multiple_partitions/lineitem_twopart` where l_shipdate=date '1992-01-01';
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

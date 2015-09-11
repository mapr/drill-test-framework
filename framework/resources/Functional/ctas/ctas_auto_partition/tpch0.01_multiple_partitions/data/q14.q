alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
select distinct l_modline, l_moddate from `tpch_multiple_partitions/lineitem_twopart_ordered2` where l_moddate=date '1992-01-01' and l_modline=0;
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

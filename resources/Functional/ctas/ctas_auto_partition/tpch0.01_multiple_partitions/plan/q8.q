alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
explain plan for select distinct l_modline, l_moddate from `tpch_multiple_partitions/lineitem_twopart_ordered` where l_modline=1;
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

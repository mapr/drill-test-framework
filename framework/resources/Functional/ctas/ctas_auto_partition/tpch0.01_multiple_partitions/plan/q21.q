alter session set `drill.exec.storage.file.partition.column.label` = 'partition_string1';
explain plan for select distinct l_modline, l_moddate from `tpch_multiple_partitions/lineitem_twopart_ordered3` where l_moddate=date '1992-01-01' and l_shipdate=date'1992-01-01';
alter session set `drill.exec.storage.file.partition.column.label` = 'dir';

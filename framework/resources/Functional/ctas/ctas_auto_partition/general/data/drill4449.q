refresh table metadata `tpch_single_partition1/drill4449`;
SELECT COUNT(*) FROM (
  SELECT l_orderkey FROM `tpch_single_partition1/drill4449` WHERE l_discount < 0.05 
  UNION ALL
  SELECT l_orderkey FROM `tpch_single_partition1/drill4449` WHERE l_discount > 0.02
);
select * from sys.options;

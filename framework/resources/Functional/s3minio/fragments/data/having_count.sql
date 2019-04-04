SET planner.width.max_per_node=100;
SET planner.slice_target=1;
SET planner.enable_multiphase_agg=false;
SELECT
  count(decimal_big.DECIMAL_15_5)
FROM
  s3minio.tmp.`big_files/T_DECIMAL_BIG` decimal_big
GROUP BY decimal_big.DECIMAL_15_5
HAVING count(decimal_big.DECIMAL_15_5) > 200277;
RESET planner.width.max_per_node;
RESET planner.slice_target;
RESET planner.enable_multiphase_agg;

SET planner.width.max_per_node=100;
SET planner.slice_target=1;
SET planner.enable_multiphase_agg=false;
SELECT
  avg(decimal_big.DECIMAL_18_8),
  avg(decimal_big.DECIMAL_2_1),
  avg(decimal_big.DECIMAL_15_5)
FROM
  s3minio.tmp.`big_files/T_DECIMAL_BIG` decimal_big
WHERE
  decimal_big.DECIMAL_18_8 < 5555555555.55555555
  OR decimal_big.DECIMAL_2_1 > 5.5
  OR decimal_big.DECIMAL_15_5 = 5838878814.62053;
RESET planner.width.max_per_node;
RESET planner.slice_target;
RESET planner.enable_multiphase_agg;

SET planner.width.max_per_node=100;
SET planner.slice_target=1;
SET planner.enable_multiphase_agg=false;
SELECT
  decimal_big.DECIMAL_15_5
FROM
  dfs.drillTestDir.`decimal/fragments/T_DECIMAL_BIG` decimal_big
UNION
SELECT
  cast(decimal_big_zero_prec.DECIMAL_2_2 as DECIMAL(15, 5)) DECIMAL_15_5
FROM
  dfs.drillTestDir.`decimal/fragments/T_DECIMAL_BIG_ZERO_PREC` decimal_big_zero_prec
ORDER BY DECIMAL_15_5
LIMIT 15;
RESET planner.width.max_per_node;
RESET planner.slice_target;
RESET planner.enable_multiphase_agg;

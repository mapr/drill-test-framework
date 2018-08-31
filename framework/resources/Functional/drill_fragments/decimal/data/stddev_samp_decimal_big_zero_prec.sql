SET planner.width.max_per_node=100;
SET planner.slice_target=1;
SET planner.enable_multiphase_agg=false;
SELECT
stddev_samp(cast(DECIMAL_18_18 as decimal(18, 18))),
stddev_samp(cast(DECIMAL_2_2 as decimal(2, 2))),
stddev_samp(cast(DECIMAL_15_15 as decimal(15, 15)))
FROM dfs.drillTestDir.`decimal/fragments/T_DECIMAL_BIG_ZERO_PREC`;
RESET planner.width.max_per_node;
RESET planner.slice_target;
RESET planner.enable_multiphase_agg;

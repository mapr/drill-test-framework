SET planner.width.max_per_node=100;
SET planner.slice_target=1;
SET planner.enable_multiphase_agg=false;
SELECT
stddev_samp(cast(DECIMAL_18_8 as decimal(18, 8))),
stddev_samp(cast(DECIMAL_2_1 as decimal(2, 1))),
stddev_samp(cast(DECIMAL_15_5 as decimal(15, 5)))
FROM dfs.drillTestDir.`decimal/fragments/T_DECIMAL_BIG`;
RESET planner.width.max_per_node;
RESET planner.slice_target;
RESET planner.enable_multiphase_agg;

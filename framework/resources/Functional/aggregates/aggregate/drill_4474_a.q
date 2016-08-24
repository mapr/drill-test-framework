SELECT
    COUNT(*),
    COUNT(state),
    COUNT(distinct state)
FROM `drill_4474.parquet`;

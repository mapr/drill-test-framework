SELECT
    COUNT(distinct state),
    COUNT(case when state = 'CA' then id end)
FROM `drill_4474.parquet`;

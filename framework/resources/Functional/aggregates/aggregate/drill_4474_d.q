SELECT
    COUNT(distinct state),
    COUNT(case when state = 'CA' AND AGE < 50 then id end)
FROM `drill_4474.parquet`;

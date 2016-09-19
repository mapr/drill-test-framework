SELECT
    COUNT(distinct state),
    COUNT(case when state = 'CA' AND AGE > 25 then id end)
FROM `drill_4474.parquet`;

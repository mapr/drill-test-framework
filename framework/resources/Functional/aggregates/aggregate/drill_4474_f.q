SELECT
    COUNT(distinct case when state = 'CA' AND AGE < 48 then id end)
FROM `drill_4474.parquet`;

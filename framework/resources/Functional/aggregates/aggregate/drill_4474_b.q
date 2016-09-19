SELECT
    COUNT(case when state = 'CA' AND AGE > 27 then id end)
FROM `drill_4474.parquet`;

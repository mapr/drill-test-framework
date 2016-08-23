SELECT
    COUNT(case when state = 'FL' AND age > 24 AND age < 49 then id end)
FROM `drill_4474.parquet`;

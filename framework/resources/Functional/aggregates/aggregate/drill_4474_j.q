SELECT
    COUNT(state),
    COUNT(case when age >35 AND age < 50 then state end)
FROM `drill_4474.parquet`;

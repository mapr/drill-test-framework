SELECT
    COUNT(state),
    COUNT(distinct case when age >25 AND age < 50 then state end)
FROM `drill_4474.parquet`;

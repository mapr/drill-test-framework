SELECT COUNT(id),
    COUNT(state),
    COUNT(distinct state),
    COUNT(distinct case when age >35 AND age < 50 then state end)
FROM `drill_4474.parquet`
GROUP BY state;

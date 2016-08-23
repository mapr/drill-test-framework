SELECT COUNT(state),
    COUNT(distinct state)
FROM `drill_4474.parquet` WHERE id > 10 and id < 300;

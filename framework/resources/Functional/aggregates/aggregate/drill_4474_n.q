SELECT COUNT(state), COUNT(distinct state) FROM (SELECT * FROM `drill_4474.parquet` ORDER BY id) sub_query;

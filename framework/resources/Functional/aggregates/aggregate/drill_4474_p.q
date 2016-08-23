SELECT
       *
FROM ( SELECT COUNT(state), COUNT(distinct state)
       FROM `drill_4474.parquet`
     ) sub_query;

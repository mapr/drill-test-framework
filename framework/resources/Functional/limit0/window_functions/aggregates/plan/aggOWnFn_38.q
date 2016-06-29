explain plan for select * from (
SELECT MAX(lastVal_col1) FROM (SELECT LAST_VALUE(col1) OVER(PARTITION BY col7 ORDER BY col1) lastVal_col1 , col7 FROM `allTypsUniq_v`) sub_query) t limit 0;
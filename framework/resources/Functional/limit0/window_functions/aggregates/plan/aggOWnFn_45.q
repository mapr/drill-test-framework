explain plan for select * from (
SELECT MIN(lead_col1) FROM (SELECT LEAD(col1) OVER(PARTITION BY col7 ORDER BY col1) lead_col1 , col7 FROM `allTypsUniq_v`) sub_query) t limit 0;
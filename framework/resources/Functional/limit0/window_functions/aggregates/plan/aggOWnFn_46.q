explain plan for select * from (
SELECT AVG(lead_col0) FROM (SELECT LEAD(col0) OVER(PARTITION BY col7 ORDER BY col0) lead_col0 , col7 FROM `allTypsUniq_v`) sub_query) t limit 0;
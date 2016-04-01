SELECT MAX(tile) FROM (SELECT NTILE(3) OVER(PARTITION BY col7 ORDER BY col1) tile FROM `allTypsUniq_v`) sub_query HAVING MAX(tile) > 2;
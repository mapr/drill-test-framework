explain plan for select * from (
SELECT MAX(cast( col5 as DATE )) OVER(PARTITION BY cast( col2 as CHAR(2)) ORDER BY cast( col0 as INT )) FROM `fewRowsAllData_v`) t limit 0;

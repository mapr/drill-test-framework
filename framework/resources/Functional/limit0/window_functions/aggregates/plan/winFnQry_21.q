explain plan for select * from (
SELECT MIN(cast( col3 as VARCHAR(52) )) OVER(PARTITION BY cast( col2 as CHAR(2)) ORDER BY cast( col0 as INT )) FROM `fewRowsAllData_v`) t limit 0;

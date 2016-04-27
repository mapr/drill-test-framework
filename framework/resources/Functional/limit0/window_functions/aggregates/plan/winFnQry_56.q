explain plan for select * from (
SELECT COUNT(cast( col3 as VARCHAR(52) )) OVER(PARTITION BY cast( col7 as DOUBLE) ORDER BY cast( col0 as INT )) FROM `fewRowsAllData_v`) t limit 0;

explain plan for select * from (
SELECT MIN(cast( col4 as TIMESTAMP )) OVER(PARTITION BY cast( col4 as TIMESTAMP) ORDER BY cast( col5 as DATE )) FROM `fewRowsAllData_v`) t limit 0;

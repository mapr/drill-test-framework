explain plan for select * from (
SELECT MAX(cast( col7 as DOUBLE )) OVER(PARTITION BY cast( col8 as TIME) ORDER BY cast( col3 as VARCHAR(52) )) FROM `fewRowsAllData_v`) t limit 0;

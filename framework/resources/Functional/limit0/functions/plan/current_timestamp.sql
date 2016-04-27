explain plan for select * from (
SELECT (CURRENT_TIMESTAMP + INTERVAL '200' YEAR(3)) - (CURRENT_TIMESTAMP + INTERVAL '200' YEAR(3))  FROM j1) t limit 0;

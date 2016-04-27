explain plan for select * from (
SELECT * FROM episodes_partitioned WHERE doctor_pt > 6 ORDER BY air_date) t limit 0;

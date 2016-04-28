explain plan for select * from (select name, create_time from student_parquet_v where create_time between '2015-02-12 02:15:45' and '2015-02-13 10:25:55') t limit 0;

explain plan for select * from ( select name from student_parquet_v where name is not null limit 5 ) t limit 0;

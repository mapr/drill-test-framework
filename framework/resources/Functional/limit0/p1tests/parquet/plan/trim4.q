explain plan for select * from ( select trim(both name) from student_parquet_v where student_id=10 ) t limit 0;

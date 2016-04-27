explain plan for select * from ( select trim(trailing 'n' from name) from student_parquet_v where student_id=10 ) t limit 0;

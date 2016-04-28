explain plan for select * from ( select trim(leading name) from student_parquet_v where student_id=10 ) t limit 0;

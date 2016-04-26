explain plan for select * from ( select position('il' in name) from student_parquet_v where name like '%il%' ) t limit 0;

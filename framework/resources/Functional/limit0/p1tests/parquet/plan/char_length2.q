explain plan for select * from ( select char_length(name) from student_parquet_v where age < 20 ) t limit 0;

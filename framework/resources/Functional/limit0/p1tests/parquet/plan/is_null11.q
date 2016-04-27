explain plan for select * from ( select studentnum from student_parquet_v where studentnum is null limit 5 ) t limit 0;

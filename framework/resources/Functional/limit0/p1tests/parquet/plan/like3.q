explain plan for select * from ( select student_id,name,age,gpa,studentnum from student_parquet_v where name like 'luke%' ) t limit 0;

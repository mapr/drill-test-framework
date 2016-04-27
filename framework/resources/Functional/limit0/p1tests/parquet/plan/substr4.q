explain plan for select * from ( select substr(student_id,1),substr(name,4),substr(age,1),substr(gpa,3),substr(studentnum,5) from student_parquet_v where student_id=10 ) t limit 0;

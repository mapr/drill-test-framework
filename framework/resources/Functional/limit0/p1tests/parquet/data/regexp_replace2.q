select regexp_replace(student_id,0,5), regexp_replace(name,'v','V'),regexp_replace(age,3,2),regexp_replace(gpa,1,2),regexp_replace(studentnum,78,0) from student_parquet_v where student_id=10;

select `replace`(student_id,0,5),`replace`(name,'v','V'),`replace`(age,3,2),`replace`(gpa,1,2),`replace`(studentnum,78,0) from student_parquet_v where student_id=10;

explain plan for select * from ( select trunc(student_id,1),trunc(age,-1),trunc(gpa,1),trunc(studentnum,-5) from student_csv_v where student_id=10 ) t limit 0;

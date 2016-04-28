explain plan for select * from ( select sign(student_id),sign(age),sign(gpa),sign(studentnum) from student_csv_v where student_id=10 ) t limit 0;

explain plan for select * from ( select length(student_id),length(name),length(age),length(gpa),length(studentnum) from student_csv_v where student_id=10 ) t limit 0;

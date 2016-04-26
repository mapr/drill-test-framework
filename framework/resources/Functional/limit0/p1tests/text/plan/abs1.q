explain plan for select * from ( select abs(student_id),abs(age),abs(gpa), abs(studentnum),abs(gpa - student_id) from student_csv_v where student_id=10 ) t limit 0;

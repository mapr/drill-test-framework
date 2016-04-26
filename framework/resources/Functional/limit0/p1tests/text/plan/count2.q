explain plan for select * from ( select count(student_id),count(name), count(age),count(gpa), count(studentnum) from student_csv_v where age < 30 ) t limit 0;

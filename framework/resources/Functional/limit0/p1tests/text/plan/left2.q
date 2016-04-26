explain plan for select * from ( select `left`(student_id, 1),`left`(name, 5),`left`(age,10),`left`(gpa,1), `left`(studentnum,6) from student_csv_v where student_id=10 ) t limit 0;

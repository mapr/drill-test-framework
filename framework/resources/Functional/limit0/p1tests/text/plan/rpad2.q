explain plan for select * from ( select rpad(student_id, 5), rpad(name, 15,'A'),rpad(age,4,'C'),rpad(gpa,5),rpad(studentnum,15,'B') from student_csv_v where student_id=10 ) t limit 0;

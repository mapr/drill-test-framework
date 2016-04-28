explain plan for select * from ( select (student_id + 5),(age + 5), (gpa + 1), (gpa + 1), (studentnum + 500) from student_csv_v where student_id=10 ) t limit 0;

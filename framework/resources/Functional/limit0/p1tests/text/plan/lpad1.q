explain plan for select * from ( select lpad(name, 20, 'A') from student_csv_v where student_id=10 ) t limit 0;

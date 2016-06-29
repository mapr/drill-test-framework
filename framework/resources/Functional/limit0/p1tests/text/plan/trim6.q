explain plan for select * from ( select trim(leading 'v' from name) from student_csv_v where student_id=10 ) t limit 0;

explain plan for select * from ( select student_id,name,age,gpa,studentnum,create_time from student_csv_v where name similar to '%(young|luke)%' ) t limit 0;

explain plan for select * from ( select student_id,name,age,gpa,studentnum from student_csv_v where name not similar to '%(young|u|a|i)%' ) t limit 0;

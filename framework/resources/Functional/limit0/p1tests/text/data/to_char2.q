select to_char(student_id, '#%'),to_char(age,'$'),to_char(gpa,'#.#'),to_char(studentnum,'#.##E00'),to_char(create_time,'hh:MM:ss:SS a') from student_csv_v where student_id=10;

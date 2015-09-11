select student.name, student.age, student.gpa, voter.registration from student inner join voter using (name);

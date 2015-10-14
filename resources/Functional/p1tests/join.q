select student.name, student.age, student.gpa, voter.registration from student join voter on (student.name = voter.name);
